<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
<c:if test="${cmd eq 'finish'}">
alert('${msg}');
opener.parent.location.reload();
window.close();
</c:if>
</script>