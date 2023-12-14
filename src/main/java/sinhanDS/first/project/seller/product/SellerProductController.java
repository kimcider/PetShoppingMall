package sinhanDS.first.project.seller.product;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;
import sinhanDS.first.project.product.vo.ProductCategoryVO;
import sinhanDS.first.project.product.vo.ProductOptionVO;
import sinhanDS.first.project.product.vo.ProductQnAVO;
import sinhanDS.first.project.product.vo.ProductVO;
import sinhanDS.first.project.seller.vo.SellerVO;


@Controller
@RequestMapping("/seller/product")
@Slf4j
public class SellerProductController {
	@Autowired
	private SellerProductService service;

	@Value("${realPath.registed_img_path}")
	private String registed_img_path;

	private char[] method;

	@GetMapping("/regist.do")
	public String regist(Model model) {
		ProductCategoryVO vo = new ProductCategoryVO();
		model.addAttribute("category", vo);
		return "seller/product/regist";
	}

	@PostMapping("/regist.do")
	public String regist(@RequestParam MultipartFile filename, HttpServletRequest request, ProductVO vo,
			ProductCategoryVO cvo, ProductOptionVO ovo) {
		if (filename != null) {
			vo = service.upload_file(filename, vo);
		}
		vo = service.regist_product(vo);
		service.regist_category(vo, cvo);
		service.regist_option(vo, ovo);

		return "redirect:/seller/index.do";
	}

	@PostMapping("/regist_forTest.do")
	public String regist_forTest(HttpServletRequest request, ProductVO vo, ProductCategoryVO cvo, ProductOptionVO ovo) {
		vo = service.regist_product(vo);
		service.regist_category(vo, cvo);
		service.regist_option(vo, ovo);

		return "redirect:/seller/index.do";
	}

	@GetMapping("/list.do")
	public String list(HttpSession sess, Model model) {
		SellerVO seller = (SellerVO) sess.getAttribute("sellerLoginInfo");

		List<ProductVO> productList = service.getProductList(seller.getNo());
		List<List<ProductCategoryVO>> categoryList = service.getCategoryLists(productList);
		List<List<ProductOptionVO>> optionList = service.getOptionLists(productList);
		model.addAttribute("productList", productList);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("optionList", optionList);
		model.addAttribute("registed_img_path", registed_img_path);

		return "seller/product/list";
	}

	@GetMapping("/edit.do")
	public String edit(Model model, ProductVO vo) {
		ProductVO pvo = service.getProduct(vo.getNo());
		List<ProductCategoryVO> categoryList = service.getCategories(vo.getNo());
		List<ProductOptionVO> optionList = service.getOptions(vo.getNo());
		model.addAttribute("category", new ProductCategoryVO());
		model.addAttribute("pvo", pvo);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("optionList", optionList);
		model.addAttribute("registed_img_path", registed_img_path);
		return "seller/product/edit";
	}

	@PostMapping("/edit.do")
	public String edit2(@RequestParam MultipartFile filename, ProductVO vo, ProductCategoryVO cvo,
			ProductOptionVO ovo) {
		service.remove_file(vo);
		service.upload_file(filename, vo);

		service.editProduct(vo);
		service.removeCategory(vo.getNo());
		service.removeOption(vo.getNo());
		service.regist_category(vo, cvo);
		service.regist_option(vo, ovo);
		return "redirect:/seller/index.do";
	}

	@PostMapping("/remove.do")
	public String remove(ProductVO vo) {
		System.out.println("product image_url체크  :" + vo.getImage_url());
		service.remove_file(vo);
		service.removeCategory(vo.getNo());
		service.removeOption(vo.getNo());
		service.removeProduct(vo.getNo());
		return "redirect:/seller/index.do";
	}

	// 신정훈 qna 답변 페이지 구현 (2023 - 12 - 12)
	@RequestMapping(value = "/qnalist.do", method = RequestMethod.GET)
	public String QnA_list(Model model, HttpSession sess, HttpServletRequest request, ProductVO pvo,
			ProductQnAVO qnavo) {
		System.out.println("체크체크");
		SellerVO seller = (SellerVO) sess.getAttribute("sellerLoginInfo");

		int seller_no = seller.getNo();

		List<ProductQnAVO> qna_list = service.getQnAList(seller_no);
		System.out.println("qna_list 다나올거임!! " + qna_list);

		List<ProductVO> product_list = service.getProductList(seller_no);

			List<List<String>> qna_array = new ArrayList<List<String>>();
			 for(int i = 0; i < product_list.size(); i++) {
				 List<String> putName = new ArrayList<String>();
				
				for(int j = 0; j < product_list.size(); j++) {
					if (qna_list.get(i).getProduct_no() == product_list.get(j).getNo()) {  
						putName.add(product_list.get(j).getName()); //동결 건조 간식
					}
				}
						
				putName.add(String.valueOf(qna_list.get(i).getProduct_no())); // 제품 번호 4
				putName.add(String.valueOf(qna_list.get(i).getNo())); // 질문 번호 6 
				putName.add(String.valueOf(qna_list.get(i).getQuestion_write_date())); // 질문 등록일 2023-11-29
				putName.add(qna_list.get(i).getQuestion_content()); // 질문 내용 동결?
				
				putName.add(String.valueOf(qna_list.get(i).getAnswer_write_date())); //답변 등록일 11 - 29
				putName.add(String.valueOf(qna_list.get(i).getAnswer_content())); // 답변 내용
				putName.add(String.valueOf(qna_list.get(i).getStatus())); // 상태 표시
				qna_array.add(putName);
			}
			 
			 System.out.println(qna_array);

		model.addAttribute("qna_array",qna_array);
		model.addAttribute("qna_list", qna_list);
		model.addAttribute("product_list", product_list);

		return "seller/product/qnaanswer";

	}

	@GetMapping("/qnaanswer.do")
	public String QnA_answer(Model model, HttpSession sess, HttpServletRequest request, ProductQnAVO qnavo) {
		
		SellerVO seller = (SellerVO) sess.getAttribute("sellerLoginInfo");
		int seller_no = seller.getNo();
		int r = service.setQnAanswer(qnavo);
		System.out.println("값이 들어가나??? " + r);

		return "seller/product/qnaanswer";

	}

}
