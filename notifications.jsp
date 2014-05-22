<%@ include file="/WEB-INF/jsp/include.jsp" %>
<img class="arrow" src="public_html/img/notificationArrow.png"/>
<c:choose>
	<c:when test="${empty notifications}">
		<p id="noNotifications">No notifications, yet.</p>
	</c:when>
	<c:otherwise>
		<script>
			window.onload = httpGet('seennotifications');
		</script>
	</c:otherwise>
</c:choose>

<c:forEach var="notification" items="${notifications}">
	<a href="${notification.url}">
		<c:choose>
			<c:when test="${notification.seen=='0'}">
				<div class="notification notificationNew">
			</c:when>
			<c:otherwise>
				<div class="notification">
			</c:otherwise>
		</c:choose>
			<img src="<c:url value="${notification.image}"/>" border="0">
			<span class="notificationEvent">${notification.message}</span>
			<span class="notificationDate">${notification.time}</span>
			<br clear="all"/>
		</div>
	</a>
</c:forEach>
