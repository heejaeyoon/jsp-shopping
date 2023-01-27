<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="min_java.CartDAO"%>
<%@page import="min_java.CartDTO"%>
<%@ page import="java.io.File" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

String userId = (String)session.getAttribute("userId");
System.out.println("userId >>> " + userId);
System.out.println("************");
System.out.println("request.getParameter('productId') >>> " + request.getParameter("productId"));
int productId = Integer.parseInt(request.getParameter("productId"));
System.out.println("productId >>> " + productId);

CartDAO cartDAO = CartDAO.getInstance();
CartDTO  cartdto = new CartDTO();

cartdto.getUserid();
cartdto.getProduct_id();
int result = cartDAO.deleteCart(cartdto.getProduct_id(),cartdto.getUserid());

PrintWriter script = response.getWriter();
if(result != 0){
script.println("<script>");
script.println("alert('장바구니 삭제 성공')");
script.println("location.href = 'cart.jsp'");
script.println("</script>");
}
// cart.jsp로 되돌아가기


%>
</body>
</html>