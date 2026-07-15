<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Incident Reports — Admin</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<style>
  :root {
    --maroon:        #1e1b4b;
    --maroon-light:  #312e81;
    --maroon-dark:   #0b0920;
    --maroon-pale:   #f8fafc;
    --maroon-border: rgba(30, 27, 75, 0.12);
    --shadow-sm: 0 6px 20px rgba(125,42,90,0.10);
    --sidebar-w: 272px;
  }
  * { box-sizing: border-box; }
  body { font-family:'Poppins',sans-serif; margin:0; background:var(--maroon-pale); color:#1a1a2e; }

  /* ── TOPBAR ── */
  .topbar {
    background: var(--maroon); color:#fff;
    padding: 0 20px; height: 58px;
    display: flex; align-items: center; justify-content: space-between;
    position: sticky; top: 0; z-index: 1000;
    box-shadow: 0 3px 16px rgba(125,42,90,0.28);
  }
  .topbar .brand { font-size:1.1rem; font-weight:700; }
  .topbar .btn-logout {
    background:rgba(255,255,255,0.15); color:#fff;
    border:1px solid rgba(255,255,255,0.3); border-radius:7px;
    padding:5px 16px; font-size:0.85rem; font-weight:600;
    text-decoration:none; transition:background 0.2s;
  }

  /* ── LAYOUT ── */
  .layout { display:flex; min-height:calc(100vh - 58px); }

  /* ── SIDEBAR ── */
  .sidebar {
    width: var(--sidebar-w); background:#fff;
    border-right:1px solid var(--maroon-border);
    position:sticky; top:58px; height:calc(100vh - 58px);
    padding:14px 12px; overflow-y:auto; flex-shrink:0;
    transition: all 0.3s ease;
  }
  .brand { font-size: 0.9rem; font-weight: 700; color: var(--maroon); padding: 10px 15px; text-transform: uppercase; letter-spacing: 1px; }
  .sectionTitle { font-size: 0.7rem; font-weight: 700; color: #9ca3af; text-transform: uppercase; letter-spacing: 0.05em; margin: 20px 15px 8px; }
  .navlink {
    display: flex; align-items: center; gap: 12px; padding: 10px 15px; border-radius: 12px;
    color: #4b5563; text-decoration: none; font-weight: 500; font-size: 0.9rem; transition: all 0.2s; margin-bottom: 2px;
  }
  .navlink i { width: 20px; text-align: center; color: var(--maroon); font-size: 1rem; }
  .navlink:hover { background: var(--maroon-pale); color: var(--maroon); padding-left: 20px; }
  .navlink.active { background: var(--maroon); color: #fff; font-weight: 600; box-shadow: 0 4px 12px rgba(125,42,90,0.2); }
  .navlink.active i { color: #fff; }

  /* ── MAIN ── */
  .main { flex:1; min-width:0; padding:28px 20px 48px; }
  .mainInner { max-width:1200px; margin:0 auto; animation:fadeUp 0.35s ease-out; }
  @keyframes fadeUp { from{opacity:0;transform:translateY(18px)} to{opacity:1;transform:translateY(0)} }

  /* ── PAGE HEADER ── */
  .pg-header {
    background: linear-gradient(135deg, var(--maroon) 0%, var(--maroon-light) 55%, #c04b7a 100%);
    border-radius:16px; padding:22px 28px; margin-bottom:28px;
    box-shadow:0 8px 28px rgba(125,42,90,0.22);
    display:flex; align-items:center; justify-content:space-between;
  }
  .pg-header h4 { color:#fff; font-weight:700; font-size:1.2rem; margin:0; }
  .pg-header p { color:rgba(255,255,255,0.7); margin:4px 0 0; font-size:0.85rem; }

  /* ── TABLE CARD ── */
  .card-table {
    background:#fff; border-radius:16px; overflow:hidden;
    border:1px solid var(--maroon-border); box-shadow:var(--shadow-sm);
  }
  .table { margin-bottom:0; }
  .table thead th {
    background: var(--maroon); color:#fff;
    font-size:0.75rem; font-weight:700; text-transform:uppercase;
    letter-spacing:0.05em; padding:16px; border:none; text-align:center;
  }
  .table tbody td {
    padding:16px; vertical-align:middle; border-bottom:1px solid var(--maroon-border);
    font-size:0.9rem; text-align:center;
  }
  .table tbody tr:hover { background:rgba(125,42,90,0.02); }
  
  .desc-cell { text-align:left !important; max-width:280px; font-size:0.85rem; color:#4b5563; line-height:1.5; }

  /* ── BADGES ── */
  .badge-status {
    padding:6px 12px; border-radius:999px; font-size:0.75rem; font-weight:700;
    display:inline-block; border:1px solid transparent;
  }
  .status-PENDING      { background:#fff7ed; color:#9a3412; border-color:#ffedd5; }
  .status-REVIEWED     { background:#eff6ff; color:#1e40af; border-color:#dbeafe; }
  .status-ACTION_TAKEN { background:#f0fdf4; color:#166534; border-color:#dcfce7; }

  /* ── ACTION SELECT ── */
  .form-select-custom {
    padding:6px 10px; border-radius:8px; border:1px solid var(--maroon-border);
    font-size:0.82rem; background:var(--maroon-pale); transition:all 0.2s;
    cursor:pointer;
  }
  .form-select-custom:focus { outline:none; border-color:var(--maroon); background:#fff; }
  
  .btn-update {
    background:var(--maroon); color:#fff; border:none;
    padding:6px 14px; border-radius:8px; font-size:0.82rem; font-weight:700;
    transition:all 0.2s;
  }
  .btn-update:hover { background:var(--maroon-light); transform:translateY(-1px); }

  .btn-view-media {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 6px;
    background: var(--maroon-pale); 
    color: var(--maroon); 
    border: 1px solid var(--maroon-border);
    padding: 6px 14px; 
    border-radius: 8px; 
    font-size: 0.82rem; 
    font-weight: 700;
    text-decoration: none; 
    transition: all 0.2s ease;
    white-space: nowrap;
  }
  .btn-view-media:hover { 
    background: var(--maroon); 
    color: #fff; 
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(125,42,90,0.15);
  }

  @media(max-width:992px){
    .layout{flex-direction:column;}
    .sidebar{width:100%;position:relative;top:0;height:auto;border-right:none;border-bottom:1px solid var(--maroon-border);}
  }
</style>
</head>
<body>

<div class="topbar">
  <span class="brand">&#x1F6E1;&#xFE0F; Fight D Fear Admin</span>
  <a href="${pageContext.request.contextPath}/admin/logout" class="btn-logout">
    <i class="fas fa-sign-out-alt"></i> Logout
  </a>
</div>

<div class="layout">
  <%@ include file="globalAdminMenu.jsp" %>

  <main class="main">
    <div class="mainInner">
      
      <!-- Header -->
      <div class="pg-header">
        <div>
          <h4><i class="fas fa-shield-alt me-2"></i>Incident Management</h4>
          <p>Review and update the status of community-reported safety incidents</p>
        </div>
      </div>

      <!-- Incident Table -->
      <div class="card-table">
        <div class="table-responsive">
          <table class="table align-middle">
            <thead>
              <tr>
                <th>ID</th>
                <th>Type</th>
                <th>Location</th>
                <th>Description</th>
                <th>Media</th>
                <th>Status</th>
                <th>Actions</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="incident" items="${incidents}">
                <tr>
                  <td class="fw-bold text-maroon">#${incident.id}</td>
                  <td>
                    <span class="fw-600">${incident.type}</span>
                  </td>
                  <td>
                    <i class="fas fa-map-marker-alt text-muted me-1"></i> ${incident.location}
                  </td>
                  <td class="desc-cell">${incident.description}</td>
                  <td>
                    <c:if test="${not empty incident.mediaPath}">
                      <a href="${pageContext.request.contextPath}${incident.mediaPath}" target="_blank" class="btn-view-media">
                        <i class="fas fa-image me-1"></i> View
                      </a>
                    </c:if>
                    <c:if test="${empty incident.mediaPath}">
                      <span class="text-muted small">None</span>
                    </c:if>
                  </td>
                  <td>
                    <span class="badge-status status-${incident.status}">
                      ${incident.status}
                    </span>
                  </td>
                  <td>
                    <form action="${pageContext.request.contextPath}/incidents/update/${incident.id}" method="post" class="d-flex gap-2 justify-content-center">
                      <select name="status" class="form-select-custom">
                        <option value="PENDING" ${incident.status == 'PENDING' ? 'selected' : ''}>Pending</option>
                        <option value="REVIEWED" ${incident.status == 'REVIEWED' ? 'selected' : ''}>Reviewed</option>
                        <option value="ACTION_TAKEN" ${incident.status == 'ACTION_TAKEN' ? 'selected' : ''}>Action Taken</option>
                      </select>
                      <button type="submit" class="btn-update">Update</button>
                    </form>
                  </td>
                </tr>
              </c:forEach>
              <c:if test="${empty incidents}">
                <tr>
                  <td colspan="7" class="py-5 text-center text-muted">
                    <i class="fas fa-inbox fa-3x mb-3 d-block"></i>
                    No incidents reported yet.
                  </td>
                </tr>
              </c:if>
            </tbody>
          </table>
        </div>
      </div>

    </div>
  </main>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

