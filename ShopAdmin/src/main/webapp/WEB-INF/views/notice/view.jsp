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
              <li class="breadcrumb-item"><a href="index.html">View Detail</a></li>
              <li class="breadcrumb-item active">Tables</li>
          </ol>
		<a class="btn btn-primary mb-3 btn-block" href="/notice/list?pageNum=${page.pageNum}" role="button">List</a>
             <div class="card mb-4">
                <div class="card-header">
                   <i class="fas fa-table me-1"></i>
                     DataTable Example
                </div>
      	        <div class="card-body">
                  <table id="datatablesSimple">
                      
                          <tr>
                              <th>No.</th>
                              <td>${notice.n_num}</td>
                              <th>작성자</th>
                              <td>${notice.n_name}</td>
                          </tr>
                          <tr>
                             <th>제목</th>
                             <td collapse="3">${notice.n_subject}</td>
                         </tr>
                         <tr>
                              <th collapse="4">Contents</th>
                         </tr>
                         <tr>
                             <td collapse="4">${notice.n_contents}</td>
                        </tr>
			             <tr>
                             <th>Date</th>
                             <td>${notice.n_date}</td>
                         </tr>
                         <tr>
                             <td>${notice.n_file}</td>
                          </tr>
                    </table>
                       <div class="mt-4 mb-0">
                               
							<a href="/notice/update?n_num=${notice.n_num}&pageNum=${page.pageNum}" class="btn btn-primary btn-sm">[수정]</a>
							<a href="/notice/delete?n_num=${notice.n_num}" class="btn btn-primary btn-sm">[삭제]</a>
						
                          </div>
                            </div>
                        </div>
                    </div>
                </main>
</div>





<%@ include file="../include/footer.jsp"%>