<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="./include/header.jsp"%>


<!-- Main -->
	<div id="main">

		<!-- Featured Post -->
			<article class="post featured">
				<header class="major">
					<span class="date">${serverTime}</span>
					<h2><a href="#">And this is a<br />
					massive headline</a></h2>
					<p>Aenean ornare velit lacus varius enim ullamcorper proin aliquam<br />
					facilisis ante sed etiam magna interdum congue. Lorem ipsum dolor<br />
					amet nullam sed etiam veroeros.</p>
				</header>
			</article>

		<!-- Posts -->
			<section class="posts">
			
			<c:forEach items="${list}" var="product">
			
				
				<article>
					<header>
						<span class="date">${product.p_code}</span>
						<h2><a href="#">${product.p_name}</a></h2>
					</header>
					<a href="#" class="image fit"><img src="/resources/product/${product.p_code}.jpg" alt="이미지 준비중" /></a>
					<p class="align-center">&#8361;${product.p_price}</p>
					<ul class="actions special">
						<li><a href="/cartinsert" class="button">장바구니</a></li>
						<li><a href="#" class="button">구매하기</a></li>
					</ul>
				</article>
			
			
			</c:forEach>
			
			</section>

		<!-- Footer -->
			<footer>
				<div class="pagination">
					<!--<a href="#" class="previous">Prev</a>-->
					<a href="#" class="page active">1</a>
					<a href="#" class="page">2</a>
					<a href="#" class="page">3</a>
					<span class="extra">&hellip;</span>
					<a href="#" class="page">8</a>
					<a href="#" class="page">9</a>
					<a href="#" class="page">10</a>
					<a href="#" class="next">Next</a>
				</div>
			</footer>

	</div>


<%@ include file="./include/footer.jsp"%>
				