<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>

<!-- Main -->
	<div id="main">

		<!-- Post -->
			<section class="post">
				<header class="major">
					<span class="date">${serverTime}</span>
					<h2>회원가입</h2>
				</header>
				<form method="post" action="/member/insert" name="join_form">
					<div class="row gtr-uniform">
						<div class="col-6 col-12-xsmall">
							<input type="text" name="m_id" id="demo-id" placeholder="ID" />
						</div>
						<div class="col-6 col-12-xsmall">
							<input type="text" name="m_name" id="demo-name"  placeholder="Name" />
						</div>
						<div class="col-6 col-12-xsmall">
							<input type="password" name="m_passwd" id="demo-passwd" value="" placeholder="Password" />
						</div>
						<div class="col-6 col-12-xsmall">
							<input type="password" name="m_cpasswd" id="demo-cpasswd" value="" placeholder="Confirm Password" />
						</div>
						<!-- Break -->
						<div class="col-12">
							<input type="text" name="m_phone" id="demo-phone" value="" placeholder="Phone Number" />
						</div>
					
						<script defer src="/resources/js/joinchk.js">			
						</script>
					
						<!-- Break -->
						<div class="col-6">
							<ul class="actions">
								<li><input type="button" value="Sign Up" class="primary" onclick="joinchk();" /></li>
								<li><input type="reset" value="Reset" /></li>
							</ul>
						</div>
					</div>
				</form>
				
				
			</section>

	

	</div>
<%@ include file="../include/footer.jsp"%>