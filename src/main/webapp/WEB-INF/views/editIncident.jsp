<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Incident</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css">
   <script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<!-- updateIncident.jsp -->
<h2>Update Incident</h2>

<form action="${pageContext.request.contextPath}/incidents/incidentUpdate/${incident.id}" method="post" enctype="multipart/form-data">
    <div>
        <label for="type">Incident Type</label>
        <input type="text" id="type" name="type" value="${incident.type}" required />
    </div>

    <div>
        <label for="location">Location</label>
        <input type="text" id="location" name="location" value="${incident.location}" required />
    </div>

    <div>
        <label for="description">Description</label>
        <textarea id="description" name="description" required>${incident.description}</textarea>
    </div>

    <div>
        <label for="file">New Media (optional)</label>
        <input type="file" id="file" name="file" />
    </div>

    <div>
        <button type="submit">Update Incident</button>
    </div>
</form>

<a href="${pageContext.request.contextPath}/incidents/userReportedIncidents">Back to Profile</a>


</body>
</html>
