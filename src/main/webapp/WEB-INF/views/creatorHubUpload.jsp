<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload Content - Women Creator Hub</title>
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
            background-image: radial-gradient(circle at 10% 20%, rgba(139, 92, 246, 0.1) 0%, transparent 40%),
                              radial-gradient(circle at 90% 80%, rgba(244, 63, 94, 0.1) 0%, transparent 40%);
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
            padding: 30px;
            backdrop-filter: blur(15px);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
        }

        .form-control, .form-select {
            background-color: rgba(255, 255, 255, 0.04);
            border: 1px solid var(--border-color);
            color: #fff;
            border-radius: 12px;
            padding: 12px 18px;
            transition: all 0.3s;
        }
        .form-control:focus, .form-select:focus {
            background-color: rgba(255, 255, 255, 0.07);
            border-color: var(--primary-accent);
            box-shadow: 0 0 15px rgba(244, 63, 94, 0.25);
            color: #fff;
        }

        .upload-dropzone {
            border: 2px dashed rgba(255, 255, 255, 0.15);
            border-radius: 20px;
            padding: 40px;
            text-align: center;
            background: rgba(255, 255, 255, 0.02);
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
        }
        .upload-dropzone:hover {
            border-color: var(--primary-accent);
            background: rgba(244, 63, 94, 0.03);
        }
        .upload-icon {
            font-size: 40px;
            color: var(--text-muted);
            margin-bottom: 15px;
            transition: color 0.3s;
        }
        .upload-dropzone:hover .upload-icon {
            color: var(--primary-accent);
        }

        .toggle-switch-card {
            background: rgba(255,255,255,0.02);
            border: 1px solid var(--border-color);
            border-radius: 16px;
            padding: 15px 20px;
            margin-bottom: 15px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .form-check-input {
            width: 2.8em;
            height: 1.5em;
            background-color: rgba(255,255,255,0.1);
            border-color: transparent;
            cursor: pointer;
        }
        .form-check-input:checked {
            background-color: var(--primary-accent);
            border-color: var(--primary-accent);
        }

        /* Scan Overlay */
        .scan-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            background: rgba(9, 9, 14, 0.95);
            z-index: 2000;
            display: none;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            text-align: center;
        }
        .scan-radar {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            border: 2px solid var(--primary-accent);
            position: relative;
            animation: radar-pulse 1.5s infinite linear;
            margin-bottom: 25px;
        }
        @keyframes radar-pulse {
            0% { transform: scale(0.6); opacity: 1; }
            100% { transform: scale(1.4); opacity: 0; }
        }
    </style>
</head>
<body>

    <jsp:include page="/WEB-INF/views/fragments/header.jsp" />

    <div class="container hub-container">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                
                <div class="glass-card">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <h3 class="text-white m-0"><i class="fa-solid fa-cloud-arrow-up text-danger me-2"></i>Create New Post</h3>
                        <a href="/creator-hub" class="btn btn-outline-light rounded-pill px-3 py-1 btn-sm">
                            <i class="fa-solid fa-chevron-left me-1"></i> Back to Feed
                        </a>
                    </div>

                    <c:if test="${not empty error}">
                        <div class="alert alert-danger rounded-4">${error}</div>
                    </c:if>

                    <form action="/creator-hub/upload" method="POST" enctype="multipart/form-data" id="uploadForm">
                        
                        <!-- Upload Type Selector -->
                        <div class="mb-4">
                            <label class="form-label text-white">Select Format</label>
                            <select name="uploadType" id="uploadType" class="form-select">
                                <option value="REEL">Short Reel (Vertical Video)</option>
                                <option value="LONG_VIDEO">Standard Video (Educational/Vlog)</option>
                                <option value="IMAGE">Image Post</option>
                                <option value="STORY">24h Expiring Story</option>
                            </select>
                        </div>

                        <!-- Dropzone File Input -->
                        <div class="mb-4">
                            <label class="form-label text-white">Upload Media File</label>
                            <div class="upload-dropzone" onclick="document.getElementById('fileInput').click()">
                                <i class="fa-solid fa-circle-play upload-icon" id="dropzoneIcon"></i>
                                <h6 class="text-white" id="dropzoneText">Drag & Drop or Click to Upload</h6>
                                <p class="text-muted text-xs mb-0" id="dropzoneSub">MP4, JPG, PNG or WEBP formats accepted</p>
                                <input type="file" name="file" id="fileInput" class="d-none" required onchange="handleFileSelected(this)">
                            </div>
                            <div id="filePreview" class="mt-3 text-center" style="display: none;">
                                <span class="badge bg-success py-2 px-3 rounded-pill"><i class="fa-solid fa-circle-check me-2"></i>Selected File: <span id="fileName"></span></span>
                            </div>
                        </div>

                        <!-- Thumbnail (Optional) -->
                        <div class="mb-4" id="thumbGroup">
                            <label class="form-label text-white">Upload Video Thumbnail (Optional)</label>
                            <input type="file" name="thumbnail" class="form-control" accept="image/*">
                        </div>

                        <!-- Title -->
                        <div class="mb-4" id="titleGroup">
                            <label class="form-label text-white">Title</label>
                            <input type="text" name="title" id="titleInput" class="form-control" placeholder="Describe the title of your content...">
                        </div>

                        <!-- Description -->
                        <div class="mb-4">
                            <label class="form-label text-white" id="descLabel">Caption / Description</label>
                            <textarea name="description" id="descriptionInput" rows="4" class="form-control" placeholder="Share educational content summary, safety guidelines, tips, or inspirational text..." required></textarea>
                        </div>

                        <!-- Category -->
                        <div class="mb-4" id="catGroup">
                            <label class="form-label text-white">Category</label>
                            <select name="category" class="form-select">
                                <c:forEach var="cat" items="${categories}">
                                    <option value="${cat}">${cat}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <!-- Location & Hashtags -->
                        <div class="row mb-4" id="locHashGroup">
                            <div class="col-md-6 mb-3 mb-md-0">
                                <label class="form-label text-white">Add Location</label>
                                <input type="text" name="location" class="form-control" placeholder="e.g. Mumbai, Maharashtra">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label text-white">Hashtags</label>
                                <input type="text" name="hashtags" id="hashtagsInput" class="form-control" placeholder="e.g. #womensafety #entrepreneur">
                            </div>
                        </div>

                        <!-- Monetization Switches -->
                        <div class="mb-4" id="monetizationGroup">
                            <h5 class="text-white mb-3"><i class="fa-solid fa-coins text-warning me-2"></i>Monetization & Privacy Settings</h5>
                            
                            <!-- Subscriber Only Post -->
                            <div class="toggle-switch-card">
                                <div>
                                    <span class="d-block text-white">Subscriber Only</span>
                                    <span class="text-muted text-xs">Only monthly paying subscribers can view this content.</span>
                                </div>
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="isSubscriberOnly" value="true">
                                </div>
                            </div>

                            <!-- Paid Content Unlock -->
                            <div class="toggle-switch-card">
                                <div>
                                    <span class="d-block text-white">Paid Educational Course / Video</span>
                                    <span class="text-muted text-xs">Set a direct unlock fee for this premium instructional video.</span>
                                </div>
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="isPaidContent" value="true" id="isPaidCheck" onchange="togglePriceField(this)">
                                </div>
                            </div>

                            <!-- Price Input (Hidden initially) -->
                            <div class="mb-3" id="priceFieldGroup" style="display: none; padding-left: 20px;">
                                <label class="form-label text-white">Unlock Price (Rs.)</label>
                                <input type="number" step="1" min="10" name="price" class="form-control bg-dark" placeholder="e.g. 199" style="max-width: 200px;">
                            </div>

                            <!-- Affiliate Marketing Link -->
                            <div class="toggle-switch-card">
                                <div>
                                    <span class="d-block text-white">Affiliate Marketing Link</span>
                                    <span class="text-muted text-xs">Add an external product affiliate link below the video caption.</span>
                                </div>
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" id="affiliateCheck" onchange="toggleAffiliateField(this)">
                                </div>
                            </div>

                            <div class="mb-3" id="affiliateFieldGroup" style="display: none; padding-left: 20px;">
                                <label class="form-label text-white">Product Affiliate Link URL</label>
                                <input type="url" name="affiliateLink" class="form-control bg-dark" placeholder="https://amazon.com/product-referral...">
                            </div>
                        </div>

                        <!-- Draft Settings -->
                        <div class="toggle-switch-card mb-4" id="draftGroup">
                            <div>
                                <span class="d-block text-white">Save as Draft</span>
                                <span class="text-muted text-xs">Keep this content private in your studio. Publish later.</span>
                            </div>
                            <div class="form-check form-switch">
                                <input class="form-check-input" type="checkbox" name="isDraft" value="true">
                            </div>
                        </div>

                        <!-- Actions Buttons -->
                        <div class="d-grid mt-4">
                            <button type="submit" class="btn btn-danger py-3 rounded-pill shadow-lg font-weight-bold" style="font-size: 16px;">
                                <i class="fa-solid fa-paper-plane me-2"></i> Submit and Moderation Scan
                            </button>
                        </div>

                    </form>
                </div>

            </div>
        </div>
    </div>

    <!-- AI MODERATION RADAR SIMULATION OVERLAY -->
    <div class="scan-overlay" id="scanOverlay">
        <div class="scan-radar"></div>
        <h4 class="text-white mb-2">AI Content Safety Guard Active</h4>
        <p class="text-muted px-4" style="max-width: 500px;">
            Scanning video transcripts, metadata, captions, and tags for cyberbullying, hate speech, spam, and inappropriate safety violations...
        </p>
    </div>

    <script>
        // Adjust form elements based on format
        document.getElementById('uploadType').addEventListener('change', function() {
            const format = this.value;
            const thumbGroup = document.getElementById('thumbGroup');
            const titleGroup = document.getElementById('titleGroup');
            const locHashGroup = document.getElementById('locHashGroup');
            const draftGroup = document.getElementById('draftGroup');
            const monetGroup = document.getElementById('monetizationGroup');
            const catGroup = document.getElementById('catGroup');
            const fileInput = document.getElementById('fileInput');

            if (format === 'STORY') {
                thumbGroup.style.display = 'none';
                titleGroup.style.display = 'none';
                locHashGroup.style.display = 'none';
                monetGroup.style.display = 'none';
                catGroup.style.display = 'none';
                document.getElementById('descLabel').innerText = 'Story Caption';
                document.getElementById('dropzoneIcon').className = 'fa-solid fa-camera upload-icon';
                document.getElementById('titleInput').required = false;
            } else if (format === 'IMAGE') {
                thumbGroup.style.display = 'none';
                titleGroup.style.display = 'block';
                locHashGroup.style.display = 'flex';
                monetGroup.style.display = 'block';
                catGroup.style.display = 'block';
                document.getElementById('descLabel').innerText = 'Post Caption';
                document.getElementById('dropzoneIcon').className = 'fa-solid fa-image upload-icon';
                document.getElementById('titleInput').required = true;
            } else { // Reels / Video
                thumbGroup.style.display = 'block';
                titleGroup.style.display = 'block';
                locHashGroup.style.display = 'flex';
                monetGroup.style.display = 'block';
                catGroup.style.display = 'block';
                document.getElementById('descLabel').innerText = 'Video Description';
                document.getElementById('dropzoneIcon').className = 'fa-solid fa-circle-play upload-icon';
                document.getElementById('titleInput').required = true;
            }
        });

        function handleFileSelected(input) {
            const filePreview = document.getElementById('filePreview');
            const fileName = document.getElementById('fileName');
            const dropText = document.getElementById('dropzoneText');
            
            if (input.files && input.files[0]) {
                const file = input.files[0];
                fileName.innerText = file.name + ' (' + (file.size / (1024 * 1024)).toFixed(2) + ' MB)';
                filePreview.style.display = 'block';
                dropText.innerText = 'File Selected!';
            }
        }

        function togglePriceField(checkbox) {
            const group = document.getElementById('priceFieldGroup');
            group.style.display = checkbox.checked ? 'block' : 'none';
        }

        function toggleAffiliateField(checkbox) {
            const group = document.getElementById('affiliateFieldGroup');
            group.style.display = checkbox.checked ? 'block' : 'none';
        }

        // Intercept upload to show AI safety scan animation
        document.getElementById('uploadForm').addEventListener('submit', function(e) {
            document.getElementById('scanOverlay').style.display = 'flex';
            // Allow submission
        });
    </script>
</body>
</html>
