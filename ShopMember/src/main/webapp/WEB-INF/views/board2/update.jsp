<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>


 
<div id="main">
	<section class="post">
		<header class="major">
			<span class="date">${serverTime}</span>
			<h1>자유게시판</h1>
			<c:if test="${m_id != null}">
			<ul class="actions">
				<li><a href="/board2/insert"  class="button" >게시판 글쓰기</a></li>
			</ul>
			</c:if>
		</header>

                <form action="/board2/update?pageNum=${page.pageNum}" method="post" enctype="multipart/form-data">
                  <div class="row mb-3 md-6">
                          <div class="col-12">
                              <label>No.</label>
                              <input class="form-control mb-3" type="text" name="b_num" value="${board.b_num}" readonly/>
                     	</div>	                                                
                          <div class="col-12">
                              <label>작성자</label>
                              <input class="form-control mb-3" type="text" name="b_name" value="${board.b_name}" readonly/>
                     	</div>	

                          <div class="col-12">
                              <label>제목</label>
                              <input class="form-control mb-3" type="text" value="${board.b_subject}" name="b_subject" />
                          </div>
                   </div>
                   <label>내용</label>
                   <div class="form-floating mb-3 mb-md-0">
					<textarea rows="5" class="d-grid mb-3" name="b_contents" style="width:100%">${board.b_contents}</textarea>
                  </div>
                  <div class="form-floating mb-3 mb-md-0">
                  	<label>첨부된 파일</label>
                  	<input type="text" class="form-control mb-3" name="b_fileold" value="${board.b_file}" readonly>
               	</div>
                 	<input class="form-control mb-3" id="inputPassword" type="file" name="b_file" />
                  <div class="actions">
                  	<input type="submit" class="button primary" value="수정" />
                  	<input type="button" class="button" value="취소" onclick="history.back(-1)">
                  </div>
              </form>
        	</section>            
         </div>



<%@ include file="../include/footer.jsp"%>