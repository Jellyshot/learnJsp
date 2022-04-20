<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>


<div id="main">
	<section class="post">
		<header class="major">
			<span class="date">${serverTime}</span>
			<h1>내정보 상세보기</h1>
			<ul class="actions">
				<li><a href="/member/mypage" class="button primary">MyPage</a></li>
			</ul>
		</header>


                  <table id="datatablesSimple">
                      
                          <tr>
                              <th>아이디</th>
                              <td>${member.m_id}</td>
                          </tr>
                          <tr>
                              <th>이름</th>
                              <td>${member.m_name}</td>
                          </tr>
                          <tr>
                             <th>연락처</th>
                             <td>${member.m_phone}</td>
                         </tr>
                         <tr>
                         	<th>주소</th>
                         	<td>${member.m_address01} &nbsp; ${member.m_address02 }</td>
                         </tr>
                         <tr>
                         	<th>가입일</th>
                             <td>${member.m_rdate}</td>
                        </tr>
			             <tr>
                             <th>수정일</th>
                             <td>${member.m_udate}</td>
                         </tr>
                    </table>
                    
               	<ul class="actions">    
					<li><a href="/member/update?m_id=${member.m_id}&pageNum=${page.pageNum}" class="button">[수정]</a></li>
					<li><a href="/member/delete?m_id=${member.m_id}" class="button">[삭제]</a></li>
				</ul>
						
           </section>
          </div>





<%@ include file="../include/footer.jsp"%>