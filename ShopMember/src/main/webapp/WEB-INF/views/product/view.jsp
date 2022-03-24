<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>


<script type="text/javascript">
	function ImgWinOpen(p_code){
		window.open("/product/imgupload?p_code="+p_code,"상품이미지등록","width=500,height=220,resizeable=1")
	}
</script>
<div id="layoutSidenav_content">
    <main>
     <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-5">
      <div class="container-fluid px-4">
          <h1 class="mt-4">상품 상세보기</h1>
          <ol class="breadcrumb mb-2">
              <li class="breadcrumb-item active">Tables</li>
          </ol>
		<a class="btn btn-primary mb-3 btn-block" href="/product/list?pageNum=${page.pageNum}" role="button">List</a>
             <div class="card mb-4">
		<img src="/resources/product/${product.p_code}.jpg" class="card-img-top" height="300" alt="이미지 준비중">
                <div class="card-header">
		<input type="button" value="이미지등록" class="form-control" onclick="ImgWinOpen('${product.p_code}')">
                </div>
      	        <div class="card-body">
                  <table id="datatablesSimple">
                      
                          <tr>
                              <th>상품번호</th>
                              <td>${product.p_code}</td>
                          </tr>
                          <tr>
                              <th>상품명</th>
                              <td>${product.p_name}</td>
                          </tr>
                          <tr>
                             <th>상품가격</th>
                             <td>${product.p_price}</td>
                         </tr>
                         <tr>
                        <th>등록일</th>
                             <td>${product.p_rdate}</td>
                        </tr>
			             <tr>
                             <th>수정일</th>
                             <td>${product.p_udate}</td>
                         </tr>
                    </table>
                       <div class="mt-4 mb-0">
                               
		<a href="/product/update?p_code=${product.p_code}" class="btn btn-primary">[수정]</a>
		<a href="/product/delete?p_code=${product.p_code}" class="btn btn-primary">[삭제]</a>
						
                          </div>
                            </div>
                        </div>
                    </div>
                    </div>
                    </div>
                    </div>
                </main>
</div>






<%@ include file="../include/footer.jsp"%>