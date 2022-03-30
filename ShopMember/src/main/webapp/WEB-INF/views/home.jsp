<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE HTML>

<html>
	<head>
		<title>Dream Shop</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="/resources/css/main.css" />
		<link rel="stylesheet" href="/resources/css/noscript.css" />
		
	</head>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper" class="fade-in">

				<!-- Intro -->
					<div id="intro">
						<h1>Dream<br />
						Shop</h1>
						<p>일상에서 놓치고 있는 소중한 순간들을 만나보세요.</p>
						<ul class="actions">
							<li><a href="#header" class="button icon solid solo fa-arrow-down scrolly">Continue</a></li>
						</ul>
					</div>

				<!-- Header -->
					<header id="header">
						<a href="/" class="logo">Dream Shop</a>
					</header>

				<!-- Nav -->
					<nav id="nav">
						<ul class="links">
							<li class="active"><a href="/">Main</a></li>
							<li><a href="generic.html">Generic Page</a></li>
							<li><a href="elements.html">Elements Reference</a></li>
						</ul>
						<ul class="icons">
						<c:if test="${m_id == null }">
							<li><a href="/member/login"><span class="label"><i class="fas fa-sign-in-alt"></i></span></a></li>
						</c:if>
						<c:if test="${m_id != null}">
								<li><a href="/member/mypage"><span class="label"><i class="fas fa-user"></i></span></a></li>
						</c:if>
						</ul>
					</nav>
		</div>
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
						<h2>${product.p_name}</h2>
					</header>
					<a href="#" class="image fit"><img src="/resources/product/${product.p_code}.jpg" alt="이미지 준비중" /></a>
					<p class="align-center"><fmt:formatNumber value="${product.p_price}" type="currency"/></p>
					<form action="/shop/cart" method="post">
					<ul class="actions special">
						<li><input type="hidden" value="${product.p_code}"/></li>
						<li><select name="cs_cnt">
							<c:forEach var="count" begin="1" end="10" step="1">
								<option value="${count}">${count}개</option>
							</c:forEach>
						</select></li>
						<li><input type="submit" class="button" value="장바구니"></li>
					</ul>
					</form>
				</article>
			
			
			</c:forEach>
			
			</section>

		<!-- Footer -->
			<footer>
				<div class="pagination">
					<!--<a href="#" class="previous">Prev</a>-->
					
							<c:if test="${pageview.prev}">
								<a href="/?pageNum=1"><<</a>&nbsp;&nbsp;
								<a href="/?pageNum=${pageview.startPage-1}" class="previous">Prev</a>&nbsp;&nbsp;
							</c:if>
												
							<c:forEach var="num" begin="${pageview.startPage}" end="${pageview.endPage}"> 
								<c:if test="${pageview.page.pageNum == num}">
									<b><a href="/?pageNum=${num}" class="page active">[${num}]</a></b>&nbsp;&nbsp;
								</c:if>
								<c:if test="${pageview.page.pageNum != num}">
								<a href="/?pageNum=${num}" class="page">[${num}]</a>&nbsp;&nbsp;
								</c:if>
							</c:forEach>
								
							<c:if test="${pageview.next}">
								<a href="/?pageNum=${pageview.endPage+1}" class="next">Next</a>&nbsp;&nbsp;
								<a href="/?pageNum=${pageview.realend}">>></a>&nbsp;&nbsp;
							</c:if>
							
					</div>				
					

			</footer>

	</div>


<%@ include file="./include/footer.jsp"%>
				