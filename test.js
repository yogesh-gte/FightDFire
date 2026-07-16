function toggleComments(id) {
  document.getElementById("comment-box-" + id).classList.toggle("active");
}

function toggleMute(videoId, btn) {
    const video = document.querySelector(`video[data-video-id='${videoId}']`);
    if (!video) return;
    
    // Toggle the specific video
    if (video.muted) {
        video.muted = false;
        btn.innerHTML = '<i class="bi bi-volume-up-fill"></i>';
        
        // Also unmute all other videos so as you scroll, sound stays on
        document.querySelectorAll('video').forEach(v => {
            v.muted = false;
        });
        document.querySelectorAll('.bi-volume-mute-fill').forEach(icon => {
            icon.classList.remove('bi-volume-mute-fill');
            icon.classList.add('bi-volume-up-fill');
        });
    } else {
        video.muted = true;
        btn.innerHTML = '<i class="bi bi-volume-mute-fill"></i>';
        
        // Mute all videos
        document.querySelectorAll('video').forEach(v => {
            v.muted = true;
        });
        document.querySelectorAll('.bi-volume-up-fill').forEach(icon => {
            icon.classList.remove('bi-volume-up-fill');
            icon.classList.add('bi-volume-mute-fill');
        });
    }
}

function followCreator(creatorId) {
    const btn = document.getElementById("follow-btn-" + creatorId);
    if (!btn || btn.disabled) return;

    fetch("${pageContext.request.contextPath}/users/followAjax/" + creatorId, {
        method: "POST"
    })
    .then(res => res.json())
    .then(data => {
        if (data.error === "LOGIN_REQUIRED") {
            alert("Please login to follow creators");
            window.location.href = "${pageContext.request.contextPath}/login";
            return;
        }

        if (data.status === "FOLLOWING") {
            btn.innerText = "Following";
            btn.classList.remove("btn-danger");
            btn.classList.add("btn-outline-light");
            btn.disabled = true;
        } else if (data.status === "REQUESTED") {
            btn.innerText = "Requested";
            btn.classList.remove("btn-danger");
            btn.classList.add("btn-outline-light");
            btn.disabled = true;
        }
    })
    .catch(err => console.error(err));
}

function likeVideo(videoId, btn) {
	  fetch("${pageContext.request.contextPath}/video/video/like", {
	    method: "POST",
	    headers: { "Content-Type": "application/x-www-form-urlencoded" },
	    body: "videoId=" + videoId
	  })
	  .then(res => res.json())
	  .then(data => {

	    if (data.error === "LOGIN_REQUIRED") {
	      alert("Please login to like");
	      return;
	    }

	    const icon = btn.querySelector("i");
	    const countEl = btn.nextElementSibling;

	    // ?????? liked
	    if (data.liked) {
	      icon.style.color = "red";
	    } else {
	      icon.style.color = "white";
	    }

	    countEl.innerText = data.likeCount;
	  })
	  .catch(err => console.error(err));
	}

/* Double tap like */
document.querySelectorAll("video").forEach(v => {
  let last = 0;
  v.onclick = () => {
    const now = Date.now();
    if (now - last < 400) {
      const id = v.dataset.id;
      document.getElementById("heart-" + id).classList.add("show");
      setTimeout(() => document.getElementById("heart-" + id).classList.remove("show"), 600);
      v.closest(".reel").querySelector("button").click();
    }
    last = now;
  };
});



function showReplyBox(videoId, commentId, userName) {
	  const box = document.getElementById("reply-box-" + commentId);
	  box.style.display = "block";

	  const input = document.getElementById("reply-input-" + commentId);
	  input.value = "@" + userName + " ";
	  input.focus();
	}

	function postReply(e, videoId, parentId) {
	  e.preventDefault();

	  const input = document.getElementById("reply-input-" + parentId);
	  const text = input.value;

	  fetch("${pageContext.request.contextPath}/video/comment", {
	    method: "POST",
	    headers: { "Content-Type": "application/x-www-form-urlencoded" },
	    body:
	      "videoId=" + videoId +
	      "&commentText=" + encodeURIComponent(text) +
	      "&parentId=" + parentId
	  })
	  .then(res => res.json())
	  .then(data => {
		    // Determine user name correctly
		    const userName = data.user || "${currentUser.fullName}" || "Unknown";

		    // Append reply to the correct replies container
		    const repliesContainer = document.getElementById("replies-" + parentId);
		    const replyDiv = document.createElement("div");
		    replyDiv.className = "comment";
            replyDiv.style.background = "#333";
            replyDiv.style.marginTop = "3px";
		    replyDiv.innerHTML = `<strong>${userName}:</strong> ${data.text}`;

		    repliesContainer.appendChild(replyDiv);
		    input.value = "";
            document.getElementById("reply-box-" + parentId).style.display = "none";
		});
	}

</script>
