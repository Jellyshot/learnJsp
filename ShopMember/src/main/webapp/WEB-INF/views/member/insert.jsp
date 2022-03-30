<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>

 
<div id="layoutSidenav_content">        
    <main>
    <div class="container">
     <div class="row justify-content-center">
        <div class="col-lg-7">
            <div class="card shadow-lg border-0 rounded-lg mt-5">
                <div class="card-header"><h3 class="text-center font-weight-light my-4">회원 등록</h3></div>
                <div class="card-body">
                    <form method="post" action="/member/insert">
                       <div class="form-floating mb-3">
                            <input class="form-control" name="m_id" id="inputId" type="text" placeholder="영문+숫자 아이디를 입력해주세요" />
                            <label for="inputId">아이디</label>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <div class="form-floating mb-3 mb-md-0">
                                    <input class="form-control" name="m_passwd" id="inputPassword" type="password" placeholder="비밀번호를 입력해주세요" />
                                    <label for="inputPassword">비밀번호</label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-floating mb-3 mb-md-0">
                                    <input class="form-control" name="m_cpasswd" id="inputPasswordConfirm" type="password" placeholder="비밀번호를 확인해주세요" />
                                    <label for="inputPasswordConfirm">비밀번호 확인</label>
                                </div>
                            </div>
                        </div>
                        <div class="form-floating mb-3">
                            <input class="form-control" name="m_name" id="inputEmail" type="text" placeholder="성명을 입력해주세요" />
                            <label for="inputEmail">이름</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input class="form-control" name="m_phone" id="inputPhone" type="text" placeholder="숫자만 입력해주세요" />
                            <label for="inputPhone">연락처</label>
                        </div>
                        
                        <div class="mt-4 mb-0">
                            <div class="d-grid"><input type="submit" class="btn btn-primary btn-block" value="등록"></div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</main>
</div>
	

<%@ include file="../include/footer.jsp"%>