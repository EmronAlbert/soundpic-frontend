<%@ include file="/WEB-INF/jsp/include.jsp" %>
<c:choose>
<c:when test="${count eq 0}">
	<img src="public_html/img/notifications.png" border="0" class="menuImg">
</c:when>
<c:otherwise>
	<img src="public_html/img/notifications.png" border="0" class="menuImg">
	<div class="notificationBubble" onclick="toggleDiv('notificationContainer');">${count}</div>
</c:otherwise>
</c:choose>