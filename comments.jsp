<%@ include file="/WEB-INF/jsp/include.jsp"%>
<link rel="stylesheet" type="text/css"
	href="public_html/styles/comments.css">

<c:forEach var="c" items="${comments}">
<br clear="all">
	<c:if test="${!c.invisible}">
		<div class="comments">
			<div class="name">
				<a onclick="this.firstChild.play()" class="commentplaybutton">
			<audio src="<c:url value="/getcomment?id=${c.commentID}"/>"></audio>&#9658;</a>
				<a href="${c.person.profileAdress}"><img
					src="<c:url value='/ppic?id=${c.person.id}&size=0'/>" 
					style="padding-right: 5px">${c.person.fname} ${c.person.lname} | </a> <span style="color:black;">${c.time}</span>
			
			
			</div>
	</div>
	</c:if>
</c:forEach>
