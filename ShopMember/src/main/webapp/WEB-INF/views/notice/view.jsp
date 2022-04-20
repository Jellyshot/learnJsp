<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>



<div id="main">
	<section class="post">
		<header class="major">
			<span class="date">${serverTime}</span>
			<h1>공지사항</h1>
		</header>
		<p>이벤트 및 중요사항을 확인하세요.</p>
                  <table id="datatablesSimple">
                      
                          <tr>
                              <th>No.</th>
                              <td>${notice.n_num}</td>
                              <th>작성자</th>
                              <td>${notice.n_name}</td>
                          </tr>
                          <tr>
                             <th>제목</th>
                             <td colspan="3">${notice.n_subject}</td>
                         </tr>
                         <tr>
                              <th colspan="4">Contents</th>
                         </tr>
                         <tr>
                             <td colspan="4">${notice.n_contents}</td>
                        </tr>
			             <tr>
                             <th>Date</th>
                             <td colspan="3">${notice.n_date}</td>
                         </tr>
                         <tr>
                         	<th>첨부파일</th>
                             <td colspan="3"><a href="/notice/downLoad?n_num=${notice.n_num}">${notice.n_file}</a></td>
                          </tr>
                    </table>
                     
    </section>
</div>





<%@ include file="../include/footer.jsp"%>