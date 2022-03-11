<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>



<div id="layoutSidenav_content">
    <main>
      <div class="container-fluid px-4">
          <h1 class="mt-4">Tables</h1>
          <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item"><a href="index.html">View Detail</a></li>
              <li class="breadcrumb-item active">Tables</li>
           
		<a class="btn btn-primary mb-3 btn-block" href="/board2/list?pageNum=${page.pageNum}" role="button">List</a>
          </ol>
             <div class="card mb-4">
                <div class="card-header">
                   <i class="fas fa-table me-1"></i>
                     DataTable Example
                </div>
      	        <div class="card-body">
                  <table id="datatablesSimple">
                      
                          <tr>
                              <th>No.</th>
                              <td>${board.b_num}</td>
                              <th>Name</th>
                              <td>${board.b_name}</td>
                          </tr>
                          <tr>
                             <th>Subject</th>
                             <td>${board.b_subject}</td>
                         </tr>
                         <tr>
                              <th collaspe="2">Contents</th>
                         </tr>
                         <tr>
                             <td collaspe="2">${board.b_contents}</td>
                        </tr>
			             <tr>
                             <th>Date</th>
                             <td>${board.b_date}</td>
                         </tr>
                         <tr>
                             <td>${board.b_file}</td>
                          </tr>
                    </table>
                       <div class="mt-4 mb-0">
                               
							<a href="/board2/update?b_num=${board.b_num}&pageNum=${page.pageNum}" class="btn btn-primary btn-lg">[수정]</a>
							<a href="/board2/delete?b_num=${board.b_num}" class="btn btn-primary btn-lg">[삭제]</a>
						
                          </div>
                            </div>
                        </div>
                    </div>
                </main>
</div>
        </div>





<%@ include file="../include/footer.jsp"%>