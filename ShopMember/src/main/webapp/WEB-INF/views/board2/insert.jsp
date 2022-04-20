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
				<li><a href="/board2/list"  class="button" >리스트로</a></li>
			</ul>
			</c:if>
		</header>

             <form enctype="multipart/form-data" name="writefrm" action="/board2/insert" method="post">
                 <div class="row mb-3 md-6">
                     
                         <div class="col-12">
                             <h4> 작성자</h4>
                             <input id="id_name" type="text" value="${m_id}" name="b_name" readonly/>
                     	</div>	

                         <div class="col-12">
                                <h4> 제목</h4>
                             <input class="form-control mb-3" id="id_subject" type="text" placeholder="제목을 입력해주세요" name="b_subject" />
                         </div>
                      
                 <div class="col-12">
					   <h4> 내용</h4>
					<textarea rows="5" class="d-grid mb-3" name="b_contents" style="width:100%" id="id_contents"></textarea>
	                 <input class="form-control mb-3" id="id_file" type="file" placeholder="file attached" name="b_file" />
			                 
		         </div>
		         <div class="mt-4 mb-0">
		             <div class="d-grid">
		             <input type="submit"  class="btn btn-primary btn-block" value="Write"  />
		             <!-- <a href="javascript:writeform2();">공지사항으로 가기</a> -->
	         	    </div>
			             
		         </div>
		         </div>
		     </form>
    </section>
</div>



<%@ include file="../include/footer.jsp"%>