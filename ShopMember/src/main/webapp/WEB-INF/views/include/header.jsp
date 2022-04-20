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
			<div id="wrapper">

			<!-- Header -->
				<header id="header">
					<a href="/" class="logo">Massively</a>
				</header>

				<!-- Nav -->
					<nav id="nav">
						<ul class="links">
							<li class="active"><a href="/">Shop</a></li>
							<li><a href="/notice/list">Notice</a></li>
							<li><a href="/board2/list">Board</a></li>
						</ul>
						<ul class="icons">
						<c:if test="${m_id == null }">
							<li><a href="/member/login">login</a></li>
						</c:if>
						<c:if test="${m_id != null}">
							<li><a href="/member/mypage" class="icon">MyPage</a></li>
							<li><a href="/member/logout" class="icon">Logout</a></li>
						</c:if>
						</ul>
					</nav>
