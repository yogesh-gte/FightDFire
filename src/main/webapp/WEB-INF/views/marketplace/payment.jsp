<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Payment - Marketplace</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body class="bg-light">
<div class="container py-5">
  <div class="row justify-content-center">
    <div class="col-md-5">
      <div class="card shadow border-0 rounded-4">
        <div class="card-body p-4 text-center">
          <h4 class="mb-4">Secure Payment</h4>
          <div class="mb-4">
            <h6 class="text-muted">Enrolling in:</h6>
            <h5 class="fw-bold">${enrollment.providerClass.className}</h5>
            <div class="h2 text-primary fw-bold mt-2">₹${enrollment.providerClass.price}</div>
          </div>
          <div class="alert alert-info small text-start">
            <i class="bi bi-info-circle-fill"></i> You are about to pay ₹${enrollment.providerClass.price} for this class.
          </div>
          <form action="${pageContext.request.contextPath}/marketplace/payment/confirm" method="post">
            <input type="hidden" name="enrollmentId" value="${enrollment.id}">
            <button type="submit" class="btn btn-primary w-100 py-2 rounded-pill fw-bold">Pay Now & Enroll</button>
          </form>
          <a href="${pageContext.request.contextPath}/marketplace" class="btn btn-link text-muted mt-3">Cancel</a>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>
