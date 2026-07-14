<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Creator Studio Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    
    <style>
        :root {
            --dark-bg: #09090e;
            --card-bg: rgba(20, 20, 35, 0.6);
            --border-color: rgba(255, 255, 255, 0.08);
            --primary-accent: #f43f5e;
            --secondary-accent: #8b5cf6;
            --text-main: #f3f4f6;
            --text-muted: #9ca3af;
        }

        body {
            background-color: var(--dark-bg);
            background-image: radial-gradient(circle at 10% 20%, rgba(139, 92, 246, 0.07) 0%, transparent 45%),
                              radial-gradient(circle at 90% 80%, rgba(244, 63, 94, 0.07) 0%, transparent 45%);
            color: var(--text-main);
            font-family: 'Outfit', sans-serif;
            margin: 0;
            padding-bottom: 80px;
        }

        .hub-container {
            margin-top: 110px;
        }

        .glass-card {
            background: var(--card-bg);
            border: 1px solid var(--border-color);
            border-radius: 24px;
            padding: 25px;
            backdrop-filter: blur(15px);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.25);
            margin-bottom: 30px;
        }

        .metric-card {
            background: rgba(255, 255, 255, 0.03);
            border: 1px solid var(--border-color);
            border-radius: 20px;
            padding: 20px;
            text-align: center;
        }
        .metric-value {
            font-size: 28px;
            font-weight: 800;
            color: #fff;
        }
        .metric-label {
            font-size: 13px;
            color: var(--text-muted);
            font-weight: 500;
        }

        .nav-pills {
            gap: 8px;
            margin-bottom: 30px;
        }
        .nav-pills .nav-link {
            background: rgba(255,255,255,0.03);
            border: 1px solid var(--border-color);
            color: var(--text-muted);
            border-radius: 30px;
            padding: 10px 22px;
            font-weight: 600;
            transition: all 0.3s;
        }
        .nav-pills .nav-link.active {
            background: linear-gradient(135deg, var(--primary-accent), var(--secondary-accent)) !important;
            color: #fff !important;
            border-color: transparent;
        }

        .form-control, .form-select {
            background-color: rgba(255, 255, 255, 0.04);
            border: 1px solid var(--border-color);
            color: #fff;
            border-radius: 12px;
            padding: 10px 15px;
        }
        .form-control:focus, .form-select:focus {
            background-color: rgba(255, 255, 255, 0.07);
            border-color: var(--primary-accent);
            color: #fff;
        }

        .table {
            color: var(--text-main);
            border-color: var(--border-color);
        }
        .table th {
            color: var(--text-muted);
            font-weight: 600;
            border-bottom: 2px solid var(--border-color);
        }
        .table td {
            vertical-align: middle;
            border-bottom: 1px solid rgba(255, 255, 255, 0.05);
        }

        .draft-thumb {
            width: 80px;
            height: 50px;
            object-fit: cover;
            border-radius: 8px;
            background: #000;
        }
        
        .modal-content {
            background: #0d0d15;
            border: 1px solid var(--border-color);
            border-radius: 24px;
            color: #fff;
        }
    </style>
</head>
<body>

    <jsp:include page="/WEB-INF/views/fragments/header.jsp" />

    <div class="container hub-container">
        
        <div class="d-flex align-items-center justify-content-between mb-4">
            <div>
                <h2 class="text-white m-0">Creator Studio</h2>
                <p class="text-muted mb-0">Manage uploads, monetization campaigns, safety controls, and settings.</p>
            </div>
            <a href="/creator-hub" class="btn btn-outline-danger rounded-pill px-4">
                <i class="fa-solid fa-house me-2"></i> Go to Creator Hub
            </a>
        </div>

        <c:if test="${not empty success}">
            <div class="alert alert-success rounded-4">${success}</div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="alert alert-danger rounded-4">${error}</div>
        </c:if>

        <!-- ANALYTICS METRICS BAR -->
        <div class="row mb-4">
            <div class="col-md-3 col-sm-6 mb-3 mb-md-0">
                <div class="metric-card">
                    <span class="metric-value text-primary">${totalViews}</span>
                    <span class="metric-label">Total Views</span>
                </div>
            </div>
            <div class="col-md-3 col-sm-6 mb-3 mb-md-0">
                <div class="metric-card">
                    <span class="metric-value text-danger">${totalLikes}</span>
                    <span class="metric-label">Total Likes</span>
                </div>
            </div>
            <div class="col-md-3 col-sm-6 mb-3 mb-md-0">
                <div class="metric-card">
                    <span class="metric-value text-warning">${subscriberCount}</span>
                    <span class="metric-label">Subscribers</span>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="metric-card">
                    <span class="metric-value text-success">${user.rewardPoints}</span>
                    <span class="metric-label">Rewards Points</span>
                </div>
            </div>
        </div>

        <!-- STUDIO TAB NAVIGATION -->
        <ul class="nav nav-pills" id="studioTab" role="tablist">
            <li class="nav-item">
                <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#tabContent" type="button"><i class="fa-solid fa-photo-film me-2"></i>My Content</button>
            </li>
            <li class="nav-item">
                <button class="nav-link" data-bs-toggle="tab" data-bs-target="#tabMonetize" type="button"><i class="fa-solid fa-coins me-2"></i>Monetization Center</button>
            </li>
            <li class="nav-item">
                <button class="nav-link" data-bs-toggle="tab" data-bs-target="#tabCollabs" type="button"><i class="fa-solid fa-handshake-angle me-2"></i>Sponsorships</button>
            </li>
            <li class="nav-item">
                <button class="nav-link" data-bs-toggle="tab" data-bs-target="#tabSafety" type="button"><i class="fa-solid fa-shield-cat me-2"></i>Safety & Blocks</button>
            </li>
        </ul>

        <div class="tab-content">
            
            <!-- TAB 1: MY CONTENT & DRAFTS -->
            <div class="tab-pane fade show active" id="tabContent">
                <div class="row">
                    <!-- Published Uploads -->
                    <div class="col-12 mb-4">
                        <div class="glass-card">
                            <h4 class="text-white mb-3">Published Uploads</h4>
                            <c:if test="${empty published}">
                                <div class="text-muted text-center py-4">No content published yet.</div>
                            </c:if>
                            <c:if test="${not empty published}">
                                <div class="table-responsive">
                                    <table class="table align-middle">
                                        <thead>
                                            <tr>
                                                <th>Media</th>
                                                <th>Title</th>
                                                <th>Category</th>
                                                <th>Views</th>
                                                <th>Likes</th>
                                                <th>Status</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="post" items="${published}">
                                                <tr>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${post.fileType eq 'VIDEO'}">
                                                                <video src="${post.videoPath}" class="draft-thumb" muted></video>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <img src="${post.videoPath}" class="draft-thumb" alt="thumb">
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td>
                                                        <span class="d-block font-weight-bold text-white">${post.title}</span>
                                                        <span class="text-muted text-xs">${post.uploadTime}</span>
                                                    </td>
                                                    <td>${post.category}</td>
                                                    <td>${post.viewCount}</td>
                                                    <td>${post.likeCount}</td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${post.status eq 'APPROVED'}">
                                                                <span class="badge bg-success">Approved</span>
                                                            </c:when>
                                                            <c:when test="${post.status eq 'PENDING_MODERATION'}">
                                                                <span class="badge bg-warning text-dark">Under Review</span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span class="badge bg-danger">Blocked</span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td>
                                                        <form action="/creator-hub/dashboard/deleteUpload" method="POST" onsubmit="return confirm('Delete this post permanently?')">
                                                            <input type="hidden" name="videoId" value="${post.id}">
                                                            <button type="submit" class="btn btn-outline-danger btn-sm rounded-pill"><i class="fa-regular fa-trash-can"></i> Delete</button>
                                                        </form>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </c:if>
                        </div>
                    </div>

                    <!-- Saved Drafts -->
                    <div class="col-12">
                        <div class="glass-card">
                            <h4 class="text-white mb-3">Saved Drafts</h4>
                            <c:if test="${empty drafts}">
                                <div class="text-muted text-center py-4">No drafts saved.</div>
                            </c:if>
                            <c:if test="${not empty drafts}">
                                <div class="table-responsive">
                                    <table class="table align-middle">
                                        <thead>
                                            <tr>
                                                <th>Media</th>
                                                <th>Title</th>
                                                <th>Category</th>
                                                <th>Monetization</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="draft" items="${drafts}">
                                                <tr>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${draft.fileType eq 'VIDEO'}">
                                                                <video src="${draft.videoPath}" class="draft-thumb" muted></video>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <img src="${draft.videoPath}" class="draft-thumb" alt="thumb">
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td>
                                                        <span class="d-block font-weight-bold text-white">${draft.title}</span>
                                                    </td>
                                                    <td>${draft.category}</td>
                                                    <td>
                                                        <c:if test="${draft.subscriberOnly}"><span class="badge bg-purple text-white me-1">Sub Only</span></c:if>
                                                        <c:if test="${draft.paidContent}"><span class="badge bg-warning text-dark">Course (Rs.${draft.price})</span></c:if>
                                                    </td>
                                                    <td>
                                                        <div class="d-flex gap-2">
                                                            <form action="/creator-hub/dashboard/publishDraft" method="POST">
                                                                <input type="hidden" name="videoId" value="${draft.id}">
                                                                <button type="submit" class="btn btn-sm btn-success rounded-pill px-3"><i class="fa-solid fa-paper-plane me-1"></i> Publish</button>
                                                            </form>
                                                            <form action="/creator-hub/dashboard/deleteUpload" method="POST">
                                                                <input type="hidden" name="videoId" value="${draft.id}">
                                                                <button type="submit" class="btn btn-sm btn-outline-danger rounded-pill"><i class="fa-regular fa-trash-can"></i> Delete</button>
                                                            </form>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>

            <!-- TAB 2: MONETIZATION CENTER -->
            <div class="tab-pane fade" id="tabMonetize">
                <div class="row">
                    
                    <!-- Ad Revenue Sharing -->
                    <div class="col-md-6 mb-4">
                        <div class="glass-card h-100">
                            <h4 class="text-white mb-2"><i class="fa-solid fa-rectangle-ad text-danger me-2"></i>Ad Revenue Sharing</h4>
                            <p class="text-muted text-xs">Claim accumulated ad share based on your overall video views (Rs. 0.05 per view).</p>
                            
                            <div class="p-3 rounded-4 mb-4" style="background: rgba(255,255,255,0.03);">
                                <div class="d-flex justify-content-between mb-2">
                                    <span class="text-muted">Total Views:</span>
                                    <span class="font-weight-bold text-white">${totalViews}</span>
                                </div>
                                <div class="d-flex justify-content-between mb-2">
                                    <span class="text-muted">Views Claimed:</span>
                                    <span class="font-weight-bold text-white">${user.adViewsClaimed}</span>
                                </div>
                                <div class="d-flex justify-content-between mb-2">
                                    <span class="text-muted">Unclaimed Views:</span>
                                    <span class="font-weight-bold text-white text-info">${unclaimedViews}</span>
                                </div>
                                <hr class="my-2 border-secondary">
                                <div class="d-flex justify-content-between">
                                    <span class="text-muted">Claimable Revenue:</span>
                                    <span class="font-weight-bold text-success" style="font-size: 18px;">Rs. ${estAdRevenue}</span>
                                </div>
                            </div>
                            
                            <button class="btn btn-danger w-100 rounded-pill py-2 font-weight-bold" id="claimAdBtn" onclick="claimAdRevenue()">
                                Claim Ad Share to Wallet
                            </button>
                        </div>
                    </div>

                    <!-- Creator Rewards Program Points redemption -->
                    <div class="col-md-6 mb-4">
                        <div class="glass-card h-100">
                            <h4 class="text-white mb-2"><i class="fa-solid fa-gift text-warning me-2"></i>Creator Rewards Program</h4>
                            <p class="text-muted text-xs">Convert reward points earned from user likes and views into Safety Wallet cash. (100 points = Rs. 10).</p>
                            
                            <div class="p-3 rounded-4 mb-3" style="background: rgba(255,255,255,0.03);">
                                <div class="d-flex justify-content-between align-items-center">
                                    <span class="text-muted">My Points:</span>
                                    <span class="badge bg-warning text-dark font-weight-bold py-2 px-3" style="font-size: 15px;">${user.rewardPoints} Points</span>
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label text-white">Points to Redeem</label>
                                <input type="number" id="redeemPointsInput" class="form-control" placeholder="Minimum 100 points" min="100" step="100">
                            </div>

                            <button class="btn btn-warning text-dark font-weight-bold w-100 rounded-pill py-2" onclick="requestPointsRedeem()">
                                Redeem Points
                            </button>

                            <!-- Redemptions List -->
                            <div class="mt-4">
                                <h6 class="text-white mb-2">Redemption History</h6>
                                <div style="max-height: 150px; overflow-y: auto;">
                                    <c:forEach var="c" items="${cashouts}">
                                        <div class="d-flex justify-content-between py-1 border-bottom border-secondary text-xs">
                                            <span class="text-muted">${c.points} pts &rarr; Rs. ${c.amount}</span>
                                            <span class="badge ${c.status eq 'APPROVED' ? 'bg-success' : (c.status eq 'PENDING' ? 'bg-warning text-dark' : 'bg-danger')}">${c.status}</span>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Creator Profile Custom Settings -->
                    <div class="col-12">
                        <div class="glass-card">
                            <h4 class="text-white mb-3"><i class="fa-solid fa-sliders text-info me-2"></i>Creator Profile Tier Config</h4>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label text-white">Custom Monthly Subscription Price (Rs.)</label>
                                    <div class="input-group">
                                        <input type="number" id="subPriceInput" class="form-control" placeholder="e.g. 99" value="${user.creatorSubscriptionPrice}">
                                        <button class="btn btn-outline-danger" onclick="saveSubscriptionPrice()">Save</button>
                                    </div>
                                    <small class="text-muted">Setting a price above Rs. 0 enables monthly subscriber posts locking.</small>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label text-white">Creator Affiliate Referral Code</label>
                                    <div class="input-group">
                                        <input type="text" id="affiliateCodeInput" class="form-control" placeholder="e.g. WOMENPOWER" value="${user.creatorAffiliateCode}">
                                        <button class="btn btn-outline-danger" onclick="saveAffiliateCode()">Save</button>
                                    </div>
                                    <small class="text-muted">Used to generate affiliate product tags inside captions.</small>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <!-- TAB 3: SPONSORSHIPS & BRAND COLLABS -->
            <div class="tab-pane fade" id="tabCollabs">
                <div class="glass-card">
                    <h4 class="text-white mb-3"><i class="fa-solid fa-circle-check text-info me-2"></i>Active Brand Sponsor Listings</h4>
                    <c:if test="${empty brandCampaigns}">
                        <div class="text-muted text-center py-4">No active brand campaigns listed right now. Check back soon!</div>
                    </c:if>
                    <c:if test="${not empty brandCampaigns}">
                        <div class="row">
                            <c:forEach var="bc" items="${brandCampaigns}">
                                <div class="col-md-6 mb-3">
                                    <div class="p-3 rounded-4 h-100" style="background: rgba(255,255,255,0.03); border: 1px solid var(--border-color);">
                                        <div class="d-flex justify-content-between mb-2">
                                            <span class="badge bg-danger">${bc.brandName}</span>
                                            <span class="text-success font-weight-bold">Rs. ${bc.payRate} / Post</span>
                                        </div>
                                        <h5 class="text-white">${bc.campaignTitle}</h5>
                                        <p class="text-muted text-xs mb-3">${bc.description}</p>
                                        
                                        <!-- Check if applied -->
                                        <c:set var="applied" value="false" />
                                        <c:forEach var="app" items="${myCollabApps}">
                                            <c:if test="${app.collaboration.id == bc.id}">
                                                <c:set var="applied" value="true" />
                                                <c:set var="appStatus" value="${app.status}" />
                                            </c:if>
                                        </c:forEach>

                                        <c:choose>
                                            <c:when test="${applied}">
                                                <button class="btn btn-secondary btn-sm w-100 rounded-pill" disabled>
                                                    Applied (<c:out value="${appStatus}" />)
                                                </button>
                                            </c:when>
                                            <c:otherwise>
                                                <button class="btn btn-outline-danger btn-sm w-100 rounded-pill" onclick="openApplyCollabModal(${bc.id}, '${bc.campaignTitle}')">
                                                    Apply Campaign
                                                </button>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:if>
                </div>
            </div>

            <!-- TAB 4: SAFETY & BLOCKS -->
            <div class="tab-pane fade" id="tabSafety">
                <div class="row">
                    <!-- General Safety -->
                    <div class="col-md-6 mb-4">
                        <div class="glass-card h-100">
                            <h4 class="text-white mb-3">Privacy Controls</h4>
                            <div class="toggle-switch-card">
                                <div>
                                    <span class="d-block text-white">Private Profile Status</span>
                                    <span class="text-muted text-xs">If private, only accepted followers can view your stories, posts, reels.</span>
                                </div>
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" id="privacyCheck" ${user['private'] ? 'checked' : ''} onchange="toggleProfilePrivacy()">
                                </div>
                            </div>
                            
                            <hr class="my-4 border-secondary">
                            
                            <h5 class="text-white mb-2">Community Guidelines Summary</h5>
                            <ul class="text-muted text-xs pl-3" style="line-height: 1.6;">
                                <li>Always verify info before sharing safety tools.</li>
                                <li>Educational materials must focus on skills, finance, or entrepreneurship.</li>
                                <li>Cyberbullying, hate speech, or harassment triggers instant AI blocking.</li>
                                <li>Keep comments sections supportive and professional.</li>
                            </ul>
                        </div>
                    </div>

                    <!-- Block List -->
                    <div class="col-md-6 mb-4">
                        <div class="glass-card h-100">
                            <h4 class="text-white mb-3">Blocked Creators / Users</h4>
                            <c:if test="${empty blockedUsers}">
                                <div class="text-muted text-center py-4">No users blocked currently.</div>
                            </c:if>
                            <c:if test="${not empty blockedUsers}">
                                <div style="max-height: 300px; overflow-y: auto;">
                                    <c:forEach var="bu" items="${blockedUsers}">
                                        <div class="d-flex justify-content-between align-items-center py-2 border-bottom border-secondary">
                                            <span class="text-white">${bu.blockedUser.fullName}</span>
                                            <button class="btn btn-outline-danger btn-xs rounded-pill" onclick="unblockUser(${bu.blockedUser.id})">
                                                Unblock
                                            </button>
                                        </div>
                                    </c:forEach>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>

    <!-- APPLY COLLAB MODAL -->
    <div class="modal fade" id="applyCollabModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="collabModalTitle">Apply Brand Sponsorship</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="collabCampaignId">
                    <div class="mb-3">
                        <label class="form-label text-white">Submit your pitch / creator statistics</label>
                        <textarea id="collabPitch" class="form-control" rows="4" placeholder="Briefly pitch why your creator audience is suitable for this campaign (e.g. typical engagement rates, follower demographics)..."></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary rounded-pill" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-danger rounded-pill" onclick="submitCollabApplication()">Submit Pitch</button>
                </div>
            </div>
        </div>
    </div>

    <!-- JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // CLAIM AD REVENUE
        function claimAdRevenue() {
            fetch('/creator-hub/dashboard/claim-ad-revenue', { method: 'POST' })
            .then(res => res.json())
            .then(data => {
                if (data.error) {
                    alert("Error: " + data.error);
                } else {
                    alert("Success! Rs. " + data.claimedAmount + " has been added to your Safety Wallet.");
                    window.location.reload();
                }
            });
        }

        // REDEEM REWARDS
        function requestPointsRedeem() {
            const points = document.getElementById('redeemPointsInput').value;
            if (points < 100) {
                alert("Minimum 100 points required to redeem.");
                return;
            }

            const formData = new URLSearchParams();
            formData.append('points', points);

            fetch('/creator-hub/dashboard/cashout', {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: formData.toString()
            })
            .then(res => res.json())
            .then(data => {
                if (data.error) {
                    alert("Error: " + data.error);
                } else {
                    alert("Success! Redemption request for Rs. " + data.amount + " submitted to safety board.");
                    window.location.reload();
                }
            });
        }

        // SAVE PROFILE SETTINGS
        function saveSubscriptionPrice() {
            const price = document.getElementById('subPriceInput').value;
            const formData = new URLSearchParams();
            formData.append('price', price);

            fetch('/creator-hub/dashboard/subscription-price', {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: formData.toString()
            })
            .then(res => res.json())
            .then(data => {
                if (data.success) {
                    alert("Monthly subscription price updated!");
                }
            });
        }

        function saveAffiliateCode() {
            const code = document.getElementById('affiliateCodeInput').value;
            const formData = new URLSearchParams();
            formData.append('code', code);

            fetch('/creator-hub/dashboard/affiliate-code', {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: formData.toString()
            })
            .then(res => res.json())
            .then(data => {
                if (data.success) {
                    alert("Affiliate Referral code updated!");
                }
            });
        }

        // PRIVACY SWITCH
        function toggleProfilePrivacy() {
            fetch('/creator-hub/dashboard/toggle-privacy', { method: 'POST' })
            .then(res => res.json())
            .then(data => {
                if (data.success) {
                    alert("Profile privacy updated: Now " + (data.isPrivate ? "Private" : "Public"));
                }
            });
        }

        // BLOCK SETTINGS
        function unblockUser(userId) {
            const formData = new URLSearchParams();
            formData.append('blockedUserId', userId);
            fetch('/creator-hub/dashboard/unblock', {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: formData.toString()
            })
            .then(res => res.json())
            .then(data => {
                if (data.success) {
                    alert("User unblocked successfully.");
                    window.location.reload();
                }
            });
        }

        // BRAND SPONSORSHIPS
        function openApplyCollabModal(id, title) {
            document.getElementById('collabCampaignId').value = id;
            document.getElementById('collabModalTitle').innerText = 'Apply Sponsorship - ' + title;
            new bootstrap.Modal(document.getElementById('applyCollabModal')).show();
        }

        function submitCollabApplication() {
            const id = document.getElementById('collabCampaignId').value;
            const pitch = document.getElementById('collabPitch').value;

            if (!pitch.trim()) {
                alert("Please submit your pitch");
                return;
            }

            const formData = new URLSearchParams();
            formData.append('campaignId', id);
            formData.append('pitch', pitch);

            fetch('/creator-hub/collab/apply', {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: formData.toString()
            })
            .then(res => res.json())
            .then(data => {
                if (data.success) {
                    alert("Application submitted successfully!");
                    bootstrap.Modal.getInstance(document.getElementById('applyCollabModal')).hide();
                    window.location.reload();
                } else {
                    alert("Error: " + data.error);
                }
            });
        }
    </script>
</body>
</html>
