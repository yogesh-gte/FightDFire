<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>

<meta charset="utf-8">
					<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
					<title>Connect with Members</title>
					<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&display=swap" rel="stylesheet">

			<link href="https://fonts.googleapis.com/css?family=Prata&display=swap" rel="stylesheet">
			<link rel="stylesheet" href="${pageContext.request.contextPath}/beauty/css/open-iconic-bootstrap.min.css">
						<link rel="stylesheet" href="${pageContext.request.contextPath}/beauty/css/animate.css">

						<link rel="stylesheet" href="${pageContext.request.contextPath}/beauty/css/owl.carousel.min.css">
						<link rel="stylesheet" href="${pageContext.request.contextPath}/beauty/css/owl.theme.default.min.css">
						<link rel="stylesheet" href="${pageContext.request.contextPath}/beauty/css/magnific-popup.css">

						<link rel="stylesheet" href="${pageContext.request.contextPath}/beauty/css/aos.css">

						<link rel="stylesheet" href="${pageContext.request.contextPath}/beauty/css/ionicons.min.css">

						<link rel="stylesheet" href="${pageContext.request.contextPath}/beauty/css/bootstrap-datepicker.css">
						<link rel="stylesheet" href="${pageContext.request.contextPath}/beauty/css/jquery.timepicker.css">


						<link rel="stylesheet" href="${pageContext.request.contextPath}/beauty/css/flaticon.css">
						<link rel="stylesheet" href="${pageContext.request.contextPath}/beauty/css/icomoon.css">
				<link rel="stylesheet" href="${pageContext.request.contextPath}/beauty/css/style.css">
						<!-- Icons & CSS -->
						<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
						<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
						<link href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
						<link href="${pageContext.request.contextPath}/assets/vendor/aos/aos.css" rel="stylesheet">
						<link href="${pageContext.request.contextPath}/assets/css/main.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/Fight D Fear-theme.css" rel="stylesheet">
			
					<!-- 🎨 Custom CSS -->
					<style>
					.hero-section::before, .hero-wrap .overlay {
					    content: "";
					    position: absolute;
					    top: 0; left: 0;
					    width: 100%;
					    height: 100%;
					    background: linear-gradient(135deg, rgba(63, 20, 48, 0.4) 0%, rgba(124, 45, 94, 0.2) 100%); /* 🍇 Subtle Plum Overlay */
					    z-index: 1;
					}

					.hero-section .container {
					    position: relative;
					    z-index: 2;
					    padding-top: 100px;
					}

					.hero-section h1 {
					    font-size: 2.8rem;
					    font-weight: 700;
					    margin-bottom: 20px;
					    font-family: 'Playfair Display', serif;
					    color: #fff;
					}

					.hero-section p {
					    font-size: 1.2rem;
					    color: #f8f9fa;
					    margin-bottom: 35px;
					    max-width: 650px;
					    margin-left: auto;
					    margin-right: auto;
					}

					.hero-section a.btn-primary {
					    background-color: #e6b800;  /* ✨ Soft gold */
					    border-color: #e6b800;
					    transition: 0.3s;
					}

					.hero-section a.btn-primary:hover {
					    background-color: #f1c232;  /* Slightly brighter on hover */
					    border-color: #f1c232;
					}

					.hero-section a.btn-outline-light:hover {
					    background-color: #fff;
					    color: #e6b800 !important;
					}
					/* ✨ Increase only nav item font size */
					#ftco-navbar .nav-link {
					  font-size: 1.2rem !important;  /* Slightly larger font */
					  font-weight: 300;              /* Make text a bit bolder */
					  letter-spacing: 0.5px;         /* Add spacing for cleaner look */
					  padding: 10px 18px !important; /* Slightly larger clickable area */
					  transition: all 0.3s ease;
					}

		
	.user-card {
	  transition: transform 0.3s, box-shadow 0.3s;
	}
	.user-card:hover {
	  transform: translateY(-5px);
	  box-shadow: 0 8px 20px rgba(0,0,0,0.1);
	}
	.btn.active {
	  background-color: #fff !important;
	  color: #000 !important;
	  border: 1px solid #000 !important;
	}

/* 🔽 Reduce space between header and profile image */
.hero-wrap {
  padding-top: 0 !important;
}

.hero-wrap .container {
  padding-top: 30px !important;
}

/* 🔽 Reduce profile image spacing */
.profile-image {
  margin-bottom: 6px !important;
}

/* 🔽 Reduce gap before username */
.hero-wrap h1 {
  margin-top: 6px !important;
}
/* FORCE remove top spacing on DESKTOP to pull under transparent header */
.hero-wrap,
.hero-section {
    margin-top: -100px !important; 
}

@media (max-width: 991px) {
    .hero-wrap p {
        font-size: 1rem !important;
        padding: 0 15px;
    }
    .profile-image img {
        width: 110px !important;
        height: 110px !important;
        border-width: 4px !important;
    }
    .hero-wrap, .js-fullheight {
        height: auto !important;
        min-height: auto !important;
        padding-top: 80px !important;
        padding-bottom: 40px !important;
        margin-top: 0 !important;
    }
    .btn-primary.px-4.py-3 {
        padding: 10px 15px !important;
        font-size: 0.85rem !important;
    }
    #search form {
        flex-direction: column;
        gap: 10px;
    }
    #search form button {
        width: 100%;
    }
}

@media (max-width: 480px) {
    .hero-wrap h1 {
        font-size: 1.8rem !important;
    }
    .user-card {
        margin-bottom: 15px;
    }
}
/* 📱 Mobile Responsive Fixes */
html, body {
    overflow-x: clip;
    width: 100%;
    position: relative;
}

@media (max-width: 991px) {
    .container, .container-fluid {
        padding-left: 10px !important;
        padding-right: 10px !important;
    }
    .row {
        margin-left: -5px !important;
        margin-right: -5px !important;
    }
    .col-6 {
        padding-left: 5px !important;
        padding-right: 5px !important;
    }
    .header .logo h1 {
        font-size: 1.4rem !important;
    }
    .btn-qna, .btn-getstarted {
        padding: 5px 10px !important;
        font-size: 0.75rem !important;
        margin-left: 5px !important;
    }
    
    /* Optimize cards for mobile */
    .user-card {
        padding: 15px 10px !important;
        border: 1px solid rgba(0,0,0,0.05) !important;
        box-shadow: 0 4px 12px rgba(0,0,0,0.05) !important;
        margin-bottom: 10px !important;
    }
    .user-card img {
        width: 80px !important;
        height: 80px !important;
        border: 3px solid #f8f9fa !important;
    }
    .user-card h5 {
        font-size: 1rem !important;
        font-weight: 700 !important;
        margin-top: 10px !important;
    }
    .user-card .btn {
        width: 100% !important;
        margin-top: 8px !important;
        border-radius: 8px !important;
    }

    /* Modern Horizontal Scrollable Tabs for Mobile */
    .desktop-tabs {
        display: flex !important;
        flex-wrap: nowrap !important;
        overflow-x: auto !important;
        justify-content: flex-start !important;
        padding: 15px 5px !important;
        -webkit-overflow-scrolling: touch;
        gap: 12px !important;
        scrollbar-width: none;
    }
    .desktop-tabs::-webkit-scrollbar {
        display: none;
    }
    .desktop-tabs .btn {
        flex: 0 0 auto !important;
        padding: 10px 22px !important;
        font-size: 0.9rem !important;
        white-space: nowrap !important;
        border-radius: 50px !important;
        box-shadow: 0 4px 10px rgba(0,0,0,0.1) !important;
    }
    
    /* Search Form Mobile Fix */
    #search form {
        flex-direction: column !important;
        border-radius: 15px !important;
        background: transparent !important;
        box-shadow: none !important;
        gap: 10px !important;
    }
    #search form input {
        border-radius: 15px !important;
        border: 2px solid var(--primary-purple) !important;
    }
    #search form button {
        width: 100% !important;
        border-radius: 15px !important;
        padding: 15px !important;
    }
}
    .mobile-tab-menu {
        display: none !important;
    }
}
</style>

</head>

<body>
	
<jsp:include page="/WEB-INF/views/fragments/header.jsp" />
<div id="wrapper">
    <jsp:include page="/WEB-INF/views/fragments/sidebar.jsp" />
    <div id="page-content-wrapper" style="min-height: 100vh; overflow-x: hidden;">

			<!-- END nav -->
			<!-- 🌸 User Social Profile Section -->
			<section class="hero-wrap js-fullheight" style="background-image: url('${pageContext.request.contextPath}/beauty/images/women-group.png'); background-size: cover; background-position: center;" data-stellar-background-ratio="0.5">
			  <div class="overlay"></div>
			  <div class="container">
			    <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center text-center">
					<div class="col-md-10 ftco-animate text-center">
					  
					  <!-- 🖼 Profile Image -->
					<div class="profile-image text-center">

  <c:choose>
    <c:when test="${not empty user.profilePhoto}">
    
      <img 
        src="${pageContext.request.contextPath}${user.profilePhoto}" 
        alt="${user.fullName}" 
        class="rounded-circle border border-3 border-light shadow"
        style="width:130px; height:130px; object-fit:cover;"
      />
    </c:when>
    <c:otherwise>
      <img 
        src="${pageContext.request.contextPath}/images/default-avatar.png" 
        alt="Default Avatar" 
        class="rounded-circle border border-3 border-light shadow"
        style="width:130px; height:130px; object-fit:cover;"
      />
    </c:otherwise>
  </c:choose>
</div>
					

					  <!-- 🌸 Icon -->
					  <div class="icon mb-2">
					    <span class="flaticon-lotus text-light" style="font-size: 24px;"></span>
					  </div>

					  <!-- 👤 User Name -->
					    <h1>${user.fullName}</h1>

					  <!-- 📝 Description -->
					  <p >
					    Stay connected with followers, manage requests, and explore your beauty community.
					  </p>
					


			        <!-- 🌺 Tab Buttons (Desktop) -->
<div class="desktop-tabs mb-5 d-flex flex-wrap justify-content-center gap-3">

  <button id="btn-followers" class="btn btn-primary px-4 py-3"
          style="background-color: var(--brand-purple) !important; border-radius: 8px; border: none; font-weight: 600; text-transform: uppercase; letter-spacing: 1px;"
          onclick="switchTab('followers')">
    Followers (${followers != null ? followers.size() : 0})
  </button>

  <button id="btn-following" class="btn btn-primary px-4 py-3"
          style="background-color: var(--brand-purple) !important; border-radius: 8px; border: none; font-weight: 600; text-transform: uppercase; letter-spacing: 1px;"
          onclick="switchTab('following')">
    Following (${following != null ? following.size() : 0})
  </button>

  <button id="btn-friends" class="btn btn-primary px-4 py-3"
          style="background-color: var(--brand-purple) !important; border-radius: 8px; border: none; font-weight: 600; text-transform: uppercase; letter-spacing: 1px;"
          onclick="switchTab('friends')">
    Friends (${friends != null ? friends.size() : 0})
  </button>

  <button id="btn-groups" class="btn btn-primary px-4 py-3"
          style="background-color: var(--brand-purple) !important; border-radius: 8px; border: none; font-weight: 600; text-transform: uppercase; letter-spacing: 1px;"
          onclick="switchTab('groups')">
    Groups (${groups != null ? groups.size() : 0})
  </button>

  <button id="btn-requests" class="btn btn-primary px-4 py-3"
          style="background-color: var(--brand-purple) !important; border-radius: 8px; border: none; font-weight: 600; text-transform: uppercase; letter-spacing: 1px;"
          onclick="switchTab('requests')">
    Requests (${followRequests != null ? followRequests.size() : 0})
  </button>

  <button id="btn-search" class="btn btn-primary px-4 py-3"
          style="background-color: var(--brand-purple) !important; border-radius: 8px; border: none; font-weight: 600; text-transform: uppercase; letter-spacing: 1px;"
          onclick="switchTab('search')">
    Search
  </button>

</div>

<!-- 📱 Mobile Menu Button -->
<div class="mobile-tab-menu mb-5 position-relative">
    <button class="btn btn-primary px-5 py-3 w-100" 
            style="background: linear-gradient(135deg, var(--primary-purple), var(--primary-coral)); border-radius: 50px; border: none; font-weight: 700; text-transform: uppercase; letter-spacing: 2px;"
            onclick="toggleTabMenu()">
        <i class="bi bi-grid-fill me-2"></i> Connection Menu
    </button>
    <div id="tabMenuList" class="tab-menu-list">
        <button class="tab-menu-item" onclick="handleMobileTab('followers')">Followers</button>
        <button class="tab-menu-item" onclick="handleMobileTab('following')">Following</button>
        <button class="tab-menu-item" onclick="handleMobileTab('friends')">Friends</button>
        <button class="tab-menu-item" onclick="handleMobileTab('groups')">Groups</button>
        <button class="tab-menu-item" onclick="handleMobileTab('requests')">Requests</button>
        <button class="tab-menu-item" onclick="handleMobileTab('search')">Search Members</button>
    </div>
</div>

			      </div>
			    </div>
			  </div>
			</section>

			<!-- 🌼 Main Tab Container -->
			<div id="main-content" class="container py-5">
			  <!-- 🧍 FOLLOWERS TAB -->
			  <div id="followers" class="tab-content active">
			    <h4 class="mb-4 text-primary">Followers</h4>
			    <div class="row g-2">
			      <c:forEach var="f" items="${followers}">
			        <div class="col-6 col-md-3">
			          <div class="user-card text-center shadow-sm p-3 bg-white rounded">
			            <img src="${pageContext.request.contextPath}${f.profilePhoto}" alt="${f.fullName}" class="rounded-circle mb-3" width="90" height="90">
			            <h5>${f.fullName}</h5>
			            <div class="mt-2">
			              <c:choose>
			                <c:when test="${followingStatus[f.id]}">
			                  <span class="badge bg-success mb-2">Mutual Friend</span>
			                  <a href="${pageContext.request.contextPath}/chat/window/${f.id}" class="btn btn-outline-primary btn-sm w-100">💬 Chat</a>
			                </c:when>
			                <c:when test="${pendingStatus[f.id]}">
			                  <button type="button" class="btn btn-warning btn-sm w-100" disabled>⏳ Requested</button>
			                </c:when>
			                <c:otherwise>
			                  <form action="${pageContext.request.contextPath}/users/follow/${f.id}" method="post">
			                    <input type="hidden" name="tab" value="followers">
			                    <button class="btn btn-primary btn-sm w-100">➕ Follow Back</button>
			                  </form>
			                </c:otherwise>
			              </c:choose>
			            </div>
			          </div>
			        </div>
			      </c:forEach>
			    </div>
			  </div>

			  <!-- 👣 FOLLOWING TAB -->
			  <div id="following" class="tab-content d-none">
			    <h4 class="mb-4 text-primary">Following</h4>
			    <div class="row g-2">
			      <c:forEach var="f" items="${following}">
			        <div class="col-6 col-md-3">
			          <div class="user-card text-center shadow-sm p-3 bg-white rounded">
			            <img src="${pageContext.request.contextPath}${f.profilePhoto}" alt="${f.fullName}" class="rounded-circle mb-3" width="90" height="90">
			            <h5>${f.fullName}</h5>
			            <div class="mt-2">
			              <c:if test="${friends.contains(f)}">
			                <a href="${pageContext.request.contextPath}/chat/window/${f.id}" class="btn btn-outline-primary btn-sm w-100 mb-2">💬 Chat</a>
			              </c:if>
			              <form action="${pageContext.request.contextPath}/users/unfollow/${f.id}" method="post">
			                <button class="btn btn-outline-danger btn-sm w-100">❌ Unfollow</button>
			              </form>
			            </div>
			          </div>
			        </div>
			      </c:forEach>
			    </div>
			  </div>
<div id="friends" class="tab-content d-none">
  <h4 class="mb-4 text-primary">Friends</h4>
  <div class="row g-2">
    <c:forEach var="f" items="${friends}">
      <div class="col-6 col-md-3">
        <div class="user-card text-center shadow-sm p-3 bg-white rounded">
          
          <img src="${pageContext.request.contextPath}${f.profilePhoto}"
               class="rounded-circle mb-3"
               width="90" height="90">

          <h5>${f.fullName}</h5>

          <!-- CHAT -->
          <a href="${pageContext.request.contextPath}/chat/window/${f.id}"
             class="btn btn-outline-primary btn-sm mt-2">
            💬 Chat
          </a>

          <!-- UNFOLLOW -->
          <form action="${pageContext.request.contextPath}/users/unfollow/${f.id}"
                method="post" class="mt-2">
            <button class="btn btn-outline-danger btn-sm">
              ❌ Unfollow
            </button>
          </form>

        </div>
      </div>
    </c:forEach>
  </div>
</div>


<div id="groups" class="tab-content d-none">

  <div class="d-flex flex-column flex-sm-row justify-content-between align-items-sm-center mb-4 gap-3">
    <h4 class="mb-0">My Groups</h4>
    <button class="btn d-flex align-items-center gap-2"
        style="background: linear-gradient(135deg, var(--primary-purple), var(--primary-coral)); color: white; border: none; padding: 10px 24px; border-radius: 50px; font-weight: 600; box-shadow: 0 4px 15px rgba(124, 45, 94, 0.3);"
        data-toggle="modal"
        data-target="#createGroupModal">
  <i class="bi bi-plus-circle"></i>
  CREATE GROUP
</button>

  </div>

  <div class="row g-2">
    <c:forEach var="group" items="${groups}">
      <div class="col-6 col-md-4">
        <div class="card p-3 shadow-sm">
          <h5>${group.name}</h5>
          <p class="text-muted">${group.members.size()} members</p>
          <a href="${pageContext.request.contextPath}/users/groups/chat/${group.id}"
             class="btn btn-outline-primary btn-sm">
            Open Group
          </a>
        </div>
      </div>
    </c:forEach>

    <c:if test="${empty groups}">
      <p class="text-muted">No groups yet</p>
    </c:if>
  </div>
</div>


			  <!-- ✉ REQUESTS TAB -->
			  <div id="requests" class="tab-content d-none">
			    <h4 class="mb-4 text-primary">Follow Requests</h4>
			    <div class="row g-2">
			      <c:forEach var="req" items="${followRequests}">
			        <div class="col-6 col-md-3">
			          <div class="user-card text-center shadow-sm p-3 bg-white rounded">
			            <img src="${pageContext.request.contextPath}${req.profilePhoto}" alt="${req.fullName}" class="rounded-circle mb-3" width="90" height="90">
			            <h5>${req.fullName}</h5>
			            <div class="mt-3">
			              <form action="${pageContext.request.contextPath}/users/acceptRequest/${req.id}" method="post">
			                <button type="submit" class="btn btn-success w-100 mb-2">Accept</button>
			              </form>
			              <form action="${pageContext.request.contextPath}/users/declineRequest/${req.id}" method="post">
			                <button type="submit" class="btn btn-outline-secondary w-100">Decline</button>
			              </form>
			            </div>
			          </div>
			        </div>
			      </c:forEach>
			    </div>
			  </div>

			  <!-- 🔍 SEARCH TAB -->
			  <div id="search" class="tab-content d-none">
			    <h4 class="mb-4" style="color: var(--primary-purple); font-weight: 700; letter-spacing: 1px;">FIND MEMBERS</h4>
			    <form action="${pageContext.request.contextPath}/users/search" method="get" class="d-flex mb-5 gap-0 shadow-sm" style="border-radius: 12px; overflow: hidden;">
			      <input type="hidden" name="tab" value="search">
			      <input type="text" name="keyword" class="form-control" 
                         placeholder="Search by name or email..." 
                         value="${keyword}"
                         style="border: 2px solid var(--primary-purple); border-right: none; border-radius: 12px 0 0 12px; padding: 15px 25px; font-size: 1.1rem; box-shadow: none;">
			      <button type="submit" class="btn px-5" 
                          style="background: linear-gradient(135deg, var(--primary-purple), var(--primary-coral)); color: white; border: none; border-radius: 0 12px 12px 0; font-weight: 800; letter-spacing: 2px; text-transform: uppercase;">
                      SEARCH
                  </button>
			    </form>

			    <div class="row g-2">
                  <c:if test="${empty users}">
                    <div class="col-12">
                      <div class="alert alert-info">
                        No users found. Try a different keyword.
                      </div>
                    </div>
                  </c:if>
			      <c:forEach var="u" items="${users}">
			        <div class="col-6 col-md-3">
			          <div class="user-card text-center shadow-sm p-3 bg-white rounded">
			            <img src="${u.profilePhoto}" alt="${u.fullName}" class="rounded-circle mb-3" width="90" height="90">
			            <h5>${u.fullName}</h5>
			            <p class="text-muted small">Age: ${u.age} | ${u.gender}</p>
			            <c:choose>
			              <c:when test="${followingStatus[u.id]}">
			                <button type="button" class="btn btn-outline-secondary btn-sm" disabled>Following</button>
			              </c:when>
			              <c:when test="${pendingStatus[u.id]}">
			                <button type="button" class="btn btn-outline-warning btn-sm" disabled>Requested</button>
			              </c:when>
			              <c:otherwise>
			                <form action="${pageContext.request.contextPath}/users/follow/${u.id}" method="post">
			                  <input type="hidden" name="tab" value="search">
			                  <button type="submit" class="btn btn-primary btn-sm">Follow</button>
			                </form>
			              </c:otherwise>
			            </c:choose>
			          </div>
			        </div>
			      </c:forEach>
			    </div>
			  </div>
			</div>

			<!-- 🌷 Tab Switching Script -->
			<script>
			function toggleTabMenu() {
			    const list = document.getElementById('tabMenuList');
			    list.classList.toggle('show');
			}

			function handleMobileTab(tabId) {
			    switchTab(tabId, true);
			    document.getElementById('tabMenuList').classList.remove('show');
			}

			function switchTab(tabId, shouldScroll = true) {
			  document.querySelectorAll('.tab-content').forEach(tab => tab.classList.add('d-none'));
			  const targetTab = document.getElementById(tabId);
			  if(targetTab) targetTab.classList.remove('d-none');
			  
			  document.querySelectorAll('.btn').forEach(btn => btn.classList.remove('active'));
			  document.querySelectorAll('.tab-menu-item').forEach(item => item.classList.remove('active'));
			  
			  const btn = document.getElementById('btn-' + tabId);
			  if(btn) btn.classList.add('active');
			  
			  // Update mobile menu items
			  const menuItems = document.querySelectorAll('.tab-menu-item');
			  menuItems.forEach(item => {
			      if(item.getAttribute('onclick').includes(tabId)) item.classList.add('active');
			  });

			  if(shouldScroll) {
			    const target = document.getElementById('main-content');
			    if(target) target.scrollIntoView({ behavior: 'smooth' });
			  }
			}

			(function () {
			  const urlParams = new URLSearchParams(window.location.search);
			  const tabParam = urlParams.get('tab');
			  const keyword = urlParams.get('keyword');
			  const initialTab = "${activeTab}";

			  if (tabParam) {
			    switchTab(tabParam, true);
			  } else if (keyword) {
			    switchTab('search', true);
			  } else if (initialTab) {
			    switchTab(initialTab, true);
			  }
			})();
			</script>

      <!-- 🔴 Real-time: refresh connect page when requests/friends change -->
      <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.1/sockjs.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
      <script>
        (function(){
          const userId = ${currentUser.id};
          const socket = new SockJS('${pageContext.request.contextPath}/ws-chat');
          const client = Stomp.over(socket);
          client.debug = null;

          client.connect({}, function(){
            client.subscribe("/topic/follow/" + userId, function(frame){
              try{
                const evt = JSON.parse(frame.body || "{}");
                if (evt && evt.type === "FOLLOW_STATE_CHANGED") {
                  // simplest reliable behavior: reload so tabs/lists update immediately
                  window.location.reload();
                }
              }catch(e){}
            });
          });
        })();
      </script>
		
	<!-- 🌸 Footer -->
  <jsp:include page="/WEB-INF/views/fragments/footer.jsp" />

  <!-- Scripts -->
			 	<script src="${pageContext.request.contextPath}/beauty/js/jquery.min.js"></script>
					  	<script src="${pageContext.request.contextPath}/beauty/js/jquery-migrate-3.0.1.min.js"></script>
					  	<script src="${pageContext.request.contextPath}/beauty/js/popper.min.js"></script>
					  	<script src="${pageContext.request.contextPath}/beauty/js/bootstrap.min.js"></script>
					  	<script src="${pageContext.request.contextPath}/beauty/js/jquery.easing.1.3.js"></script>
					  	<script src="${pageContext.request.contextPath}/beauty/js/jquery.waypoints.min.js"></script>
					  	<script src="${pageContext.request.contextPath}/beauty/js/jquery.stellar.min.js"></script>
					  	<script src="${pageContext.request.contextPath}/beauty/js/owl.carousel.min.js"></script>
					  	<script src="${pageContext.request.contextPath}/beauty/js/jquery.magnific-popup.min.js"></script>
					  	<script src="${pageContext.request.contextPath}/beauty/js/aos.js"></script>
					  	<script src="${pageContext.request.contextPath}/beauty/js/jquery.animateNumber.min.js"></script>
					  	<script src="${pageContext.request.contextPath}/beauty/js/bootstrap-datepicker.js"></script>
					  	<script src="${pageContext.request.contextPath}/beauty/js/jquery.timepicker.min.js"></script>
					  	<script src="${pageContext.request.contextPath}/beauty/js/scrollax.min.js"></script>
					  	<script src="${pageContext.request.contextPath}/beauty/js/google-map.js"></script>
					  	<script src="${pageContext.request.contextPath}/beauty/js/main.js"></script>


<!-- 🆕 Create Group Modal -->
<div class="modal fade" id="createGroupModal" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content" style="border-radius: 20px; border: 2px solid var(--primary-purple); overflow: hidden; box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5);">
      
      <div class="modal-header" style="background: var(--primary-purple); color: white; border: none; padding: 20px 25px;">
        <h5 class="modal-title" style="font-weight: 800; letter-spacing: 1px; text-transform: uppercase;">Create New Group</h5>
        <button type="button" class="btn-close btn-close-white" data-dismiss="modal" aria-label="Close"></button>
      </div>

   <form action="${pageContext.request.contextPath}/users/groups/create"
      method="post"
      enctype="multipart/form-data">

  <div class="modal-body" style="padding: 30px 25px; background: #fffcfd;">

    <!-- GROUP PROFILE PHOTO -->
    <div class="mb-4 text-center">
      <label class="form-label d-block" style="color: var(--primary-purple); font-weight: 700; margin-bottom: 15px;">Group Photo</label>
      <div class="input-group">
          <input type="file"
                 name="groupPhoto"
                 accept="image/*"
                 class="form-control"
                 style="border: 1px solid rgba(124, 45, 94, 0.2); border-radius: 10px; padding: 10px;"
                 required>
      </div>
    </div>

    <!-- GROUP NAME -->
    <div class="mb-4">
      <label class="form-label" style="color: var(--primary-purple); font-weight: 700;">Group Name</label>
      <input type="text"
             name="groupName"
             class="form-control"
             placeholder="Enter a unique group name"
             style="border: 1px solid rgba(124, 45, 94, 0.2); border-radius: 10px; padding: 12px 15px;"
             required>
    </div>

    <!-- ADD FRIENDS -->
    <div class="mb-4">
      <label class="form-label" style="color: var(--primary-purple); font-weight: 700;">Add Friends</label>

      <div style="max-height:200px; overflow-y:auto; padding: 10px; border: 1px solid rgba(30, 27, 75, 0.1); border-radius: 12px; background: #fbf6f9;">
        <c:forEach var="f" items="${friends}">
          <div class="form-check mb-2 p-2" style="border-bottom: 1px solid rgba(124, 45, 94, 0.05);">
            <input class="form-check-input"
                   type="checkbox"
                   name="memberIds"
                   value="${f.id}"
                   id="friend${f.id}"
                   style="cursor: pointer;">

            <label class="form-check-label ms-2" for="friend${f.id}" style="cursor: pointer; color: #444; font-weight: 500;">
              ${f.fullName}
            </label>
          </div>
        </c:forEach>
        <c:if test="${empty friends}">
            <p class="text-center text-muted py-3">No friends available to add yet.</p>
        </c:if>
      </div>
    </div>

  </div>

  <div class="modal-footer" style="padding: 20px 25px; border-top: 1px solid rgba(30, 27, 75, 0.1); background: #fffcfd;">
    <button type="button"
            class="btn"
            style="background: #6c757d; color: white; border-radius: 50px; padding: 10px 25px; font-weight: 600;"
            data-dismiss="modal">
        CANCEL
    </button>

    <button type="submit"
            class="btn"
            style="background: var(--primary-coral); color: white; border-radius: 50px; padding: 10px 30px; font-weight: 700; box-shadow: 0 4px 15px rgba(219, 39, 119, 0.3);">
        CREATE GROUP
    </button>
  </div>
</form>


    </div>
  </div>
</div>

		    </div>
</div>
</body>
		</html>

