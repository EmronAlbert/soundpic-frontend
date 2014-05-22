<%@ include file="/WEB-INF/jsp/include.jsp" %>
<c:choose>
<c:when test="${count eq 0}">
	<img src="public_html/img/notifications.png" border="0" class="toggleBtn" onclick="toggleDiv('notificationContainer');">
</c:when>
<c:otherwise>
	<img src="public_html/img/notifications.png" border="0" class="toggleBtn" onclick="toggleDiv('notificationContainer');">
	<div class="notificationBubble">${count}</div>
</c:otherwise>
</c:choose>