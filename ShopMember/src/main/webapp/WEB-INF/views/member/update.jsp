<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>


 
<!-- Post -->
<div id="main">
	<section class="post">
		<header class="major">
			<span class="date">${serverTime}</span>
			<h1>회원정보 수정</h1>
			<ul class="actions">
				<li><a href="/member/mypage" class="button primary">MyPage</a></li>
			</ul>
		</header>
		<form method="post" action="/member/update" name="join_form">
					<div class="row gtr-uniform">
						<div class="col-12">
							<label for="demo-phone">아이디</label>
							<input type="text" name="m_id" id="demo-id" value="${member.m_id}" readonly />
						</div>
						<div class="col-12">
							<label for="demo-phone">이름</label>
							<input type="text" name="m_name" id="demo-name"  value="${member.m_name}" required/>
						</div>
						<div class="col-12">
							<ul class= "actions">
								<li><a href="/member/upasswd" class="button">비밀번호 변경</a></li>
							</ul>
						</div>
						<!-- Break -->
						<div class="col-12">
							<label for="demo-phone">전화번호(숫자만입력)</label>
							<input type="text" name="m_phone" id="demo-phone" value="${member.m_phone}" pattern="^[0-9]{10,11}$" required />
						</div>
					
					
						<!-- Break -->
						<div class="col-6">
							<ul class="actions">
								<li><input type="submit" value="Update" class="primary" /></li>
								<li><input type="reset" value="Reset" /></li>
							</ul>
						</div>
					</div>
				</form>
	</section>
</div>



<%@ include file="../include/footer.jsp"%>