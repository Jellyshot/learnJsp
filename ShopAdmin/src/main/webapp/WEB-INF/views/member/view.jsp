<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>



<div id="layoutSidenav_content">
    <main>
      <div class="container-fluid px-4">
          <h1 class="mt-4">공지사항</h1>
          <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item"><a href="/member/list">리스트로</a></li>
              <li class="breadcrumb-item active">Tables</li>
          </ol>
		<a class="btn btn-primary mb-3 btn-block" href="/member/list?pageNum=${page.pageNum}" role="button">List</a>
             <div class="card mb-4">
                <div class="card-header">
                   <i class="fas fa-table me-1"></i>
                     DataTable Example
                </div>
      	        <div class="card-body">
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
                         	<th>가입일</th>
                             <td>${member.m_rdate}</td>
                        </tr>
			             <tr>
                             <th>수정일</th>
                             <td>${member.m_udate}</td>
                         </tr>
                    </table>
                       <div class="mt-4 mb-0">
                               
							<a href="/member/update?m_id=${member.m_id}&pageNum=${page.pageNum}" class="btn btn-primary btn-sm">[수정]</a>
							<a href="/member/delete?m_id=${member.m_id}" class="btn btn-primary btn-sm">[삭제]</a>
						
                          </div>
                            </div>
                        </div>
                    </div>
                </main>
</div>





<%@ include file="../include/footer.jsp"%>