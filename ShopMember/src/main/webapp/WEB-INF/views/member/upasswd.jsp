<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script>

</script>

<form name="pwdform" method="post" action="/member/upasswd">
<input type="hidden" name="m_id" value="${m_id}" />
<input type="password" name="m_passwd" placeholder="변경할 비밀번호" />
<input type="submit" value="변경">
<input type="button" value="취소" onclick="window.close();">
</form>

