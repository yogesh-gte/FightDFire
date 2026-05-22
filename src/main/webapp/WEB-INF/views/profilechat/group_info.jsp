<div class="container mt-4">

    <!-- GROUP HEADER -->
    <div class="text-center">
        <img src="${group.profilePhoto}"
             class="rounded-circle mb-2"
             width="120" height="120">

        <h4>${group.name}</h4>
        <p class="text-muted">${fn:length(group.members)} members</p>
    </div>

    <hr>

    <!-- MEMBERS LIST -->
    <ul class="list-group">
        <c:forEach var="m" items="${group.members}">
            <li class="list-group-item d-flex justify-content-between align-items-center">

                <div class="d-flex align-items-center">
                    <img src="${m.user.profilePhoto}"
                         class="rounded-circle me-3"
                         width="45" height="45">

                    <div>
                        <strong>${m.user.fullName}</strong><br>
                        <small>${m.user.phone}</small>
                    </div>
                </div>

                <div>
                    <c:if test="${m.admin}">
                        <span class="badge bg-purple">Admin</span>
                    </c:if>

                    <!-- Remove button (Admin only & not self) -->
                    <c:if test="${isAdmin && m.user.id != currentUser.id}">
                        <a href="${pageContext.request.contextPath}/groups/remove/${group.id}/${m.id}"
                           class="btn btn-sm btn-outline-danger ms-2">
                            Remove
                        </a>
                    </c:if>
                </div>

            </li>
        </c:forEach>
    </ul>

</div>

