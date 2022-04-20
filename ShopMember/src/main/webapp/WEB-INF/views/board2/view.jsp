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
				<li><a href="/board2/list"  class="button" >게시판 리스트</a></li>
			</ul>
			</c:if>
		</header>

                  <table id="datatablesSimple">
                      
                          <tr>
                              <th>No.</th>
                              <td>${board.b_num}</td>
                              <th>Name</th>
                              <td>${board.b_name}</td>
                          </tr>
                          <tr>
                             <th>Subject</th>
                             <td colspan="3">${board.b_subject}</td>
                         </tr>
                         <tr>
                              <th colspan="4">Contents</th>
                         </tr>
                         <tr>
                             <td colspan="4">${board.b_contents}</td>
                        </tr>
			             <tr>
                             <th>Date</th>
                             <td colspan="3">${board.b_date}</td>
                         </tr>
                         <tr>
                         	<th>첨부파일</th>
                         
                             <td colspan="3"><a href="/board2/downLoad?b_num=${board.b_num}">${board.b_file}</a></td>
                          </tr>
                          
                    </table>
                    <c:if test="${board.b_name == m_id}">
                       <div class="action">
							<a href="/board2/update?b_num=${board.b_num}&pageNum=${page.pageNum}" class="button primary">[수정]</a>
							<a href="/board2/delete?b_num=${board.b_num}" class="button">[삭제]</a>
                       </div>
                    </c:if>
	</section>                         
 </div>





<%@ include file="../include/footer.jsp"%>