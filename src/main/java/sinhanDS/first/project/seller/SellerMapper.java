package sinhanDS.first.project.seller;
import org.apache.ibatis.annotations.Mapper;

import sinhanDS.first.project.product.vo.OptionVO;
import sinhanDS.first.project.product.vo.ProductCategoryVO;
import sinhanDS.first.project.product.vo.ProductVO;
import sinhanDS.first.project.seller.vo.SellerVO;

@Mapper
public interface SellerMapper {
	SellerVO login(SellerVO vo);
	
	int regist(ProductVO vo);
	int regist_category(ProductCategoryVO vo);
	int regist_option(OptionVO vo);
}
