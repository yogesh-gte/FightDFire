/* global window */

(function () {
  const ctx = (window.__APP_CTX__ || "").replace(/\/$/, "");

  function $(id) {
    return document.getElementById(id);
  }

  const destinationEl = $("buddyDestination");
  const windowEl = $("buddyWindow");
  const radiusEl = $("buddyRadius");

  const startBtn = $("buddyStart");
  const stopBtn = $("buddyStop");
  const findBtn = $("buddyFind");

  const statusEl = $("buddyStatus");
  const matchList = $("matchList");
  const incomingList = $("incomingList");
  const outgoingList = $("outgoingList");

  function setStatus(msg) {
    if (statusEl) statusEl.textContent = msg || "";
  }

  function escapeHtml(s) {
    // Purpose: protect against HTML injection when rendering server data.
    return String(s)
      .replace(/&/g, "&amp;")
      .replace(/</g, "&lt;")
      .replace(/>/g, "&gt;")
      .replace(/"/g, "&quot;")
      .replace(/'/g, "&#039;");
  }

  function getLocation() {
    // Purpose: use current location for nearby matching.
    return new Promise((resolve, reject) => {
      if (!navigator.geolocation) return reject(new Error("Geolocation not supported."));
      navigator.geolocation.getCurrentPosition(
        (pos) => resolve({ lat: pos.coords.latitude, lng: pos.coords.longitude }),
        () => reject(new Error("Location permission denied.")),
        { enableHighAccuracy: true, timeout: 8000 }
      );
    });
  }

  function renderMatches(matches) {
    if (!matchList) return;
    matchList.innerHTML = "";

    if (!matches || !matches.length) {
      matchList.innerHTML = `<div class="text-muted small">No matches found yet. Try again in a few minutes.</div>`;
      return;
    }

    for (const m of matches) {
      const name = escapeHtml(m.name || "User");
      const ageStr = m.age ? `, Age: ${escapeHtml(String(m.age))}` : "";
      const dist = escapeHtml(String(m.distanceKmApprox ?? "-"));
      const area = escapeHtml(m.destinationArea || "");

      const el = document.createElement("div");
      el.className = "matchItem";
      el.innerHTML = `
        <div class="d-flex justify-content-between align-items-start gap-2">
          <div>
            <div style="font-weight:700">${name}${ageStr} <span class="text-success small">(Verified)</span></div>
            <div class="text-muted small">Approx distance: ${dist} km</div>
            <div class="text-muted small">Destination area: ${area}</div>
          </div>
          <button class="btn btn-sm btn-primary" type="button" data-av="${m.availabilityId}">
            Send request
          </button>
        </div>
      `;

      el.querySelector("button")?.addEventListener("click", async (e) => {
        const avId = e.currentTarget.getAttribute("data-av");
        await sendRequest(avId);
      });

      matchList.appendChild(el);
    }
  }

  function renderIncoming(list) {
    if (!incomingList) return;
    incomingList.innerHTML = "";

    if (!list || !list.length) {
      incomingList.innerHTML = `<div class="text-muted small">No incoming requests.</div>`;
      return;
    }

    for (const r of list) {
      const name = escapeHtml(r.fromName || "User");
      const ageStr = r.fromAge ? ` (Age: ${r.fromAge})` : "";
      const el = document.createElement("div");
      el.className = "matchItem";
      el.innerHTML = `
        <div style="font-weight:700">${name}${ageStr}</div>
        <div class="d-flex gap-2 mt-2">
          <button class="btn btn-sm btn-success" type="button" data-id="${r.id}">Accept</button>
          <button class="btn btn-sm btn-outline-danger" type="button" data-id="${r.id}">Reject</button>
        </div>
      `;
      const btns = el.querySelectorAll("button");
      btns[0].addEventListener("click", () => acceptRequest(r.id));
      btns[1].addEventListener("click", () => rejectRequest(r.id));
      incomingList.appendChild(el);
    }
  }

  function renderOutgoing(list) {
    if (!outgoingList) return;
    outgoingList.innerHTML = "";

    if (!list || !list.length) {
      outgoingList.innerHTML = `<div class="text-muted small">No outgoing requests.</div>`;
      return;
    }

    for (const r of list) {
      const name = escapeHtml(r.toName || "User");
      const ageStr = r.toAge ? ` (Age: ${r.toAge})` : "";
      const el = document.createElement("div");
      el.className = "matchItem";
      el.innerHTML = `
        <div style="font-weight:700">${name}${ageStr}</div>
        <div class="text-muted small">Pending…</div>
      `;
      outgoingList.appendChild(el);
    }
  }

  async function startBuddy() {
    const dest = (destinationEl?.value || "").trim();
    if (!dest) return setStatus("Please enter a destination area.");

    try {
      setStatus("Starting Buddy Mode…");
      const loc = await getLocation();

      const body = new URLSearchParams();
      body.set("latitude", String(loc.lat));
      body.set("longitude", String(loc.lng));
      body.set("destination", dest);
      body.set("windowMinutes", String(windowEl?.value || "60"));

      const res = await fetch(`${ctx}/buddy/availability/start`, {
        method: "POST",
        headers: { "Content-Type": "application/x-www-form-urlencoded", Accept: "application/json" },
        body,
      });
      const data = await res.json().catch(() => ({}));
      if (!res.ok) return setStatus((data && data.message) || `Failed (${res.status})`);
      setStatus((data && data.message) || "Started.");
    } catch (e) {
      setStatus(e.message || "Failed to start.");
    }
  }

  async function stopBuddy() {
    try {
      setStatus("Stopping Buddy Mode…");
      const res = await fetch(`${ctx}/buddy/availability/stop`, { method: "POST", headers: { Accept: "application/json" } });
      const data = await res.json().catch(() => ({}));
      if (!res.ok) return setStatus((data && data.message) || `Failed (${res.status})`);
      setStatus((data && data.message) || "Stopped.");
    } catch (e) {
      setStatus(e.message || "Failed to stop.");
    }
  }

  async function findMatches() {
    const dest = (destinationEl?.value || "").trim();
    if (!dest) return setStatus("Please enter a destination area.");

    try {
      setStatus("Finding matches…");
      const loc = await getLocation();
      const radiusKm = String(radiusEl?.value || "3");
      const qs = new URLSearchParams({
        latitude: String(loc.lat),
        longitude: String(loc.lng),
        destination: dest,
        radiusKm,
      });

      const res = await fetch(`${ctx}/buddy/matches?${qs.toString()}`, { headers: { Accept: "application/json" } });
      const data = await res.json().catch(() => ({}));
      if (!res.ok) return setStatus((data && data.message) || `Failed (${res.status})`);

      renderMatches((data && data.matches) || []);
      setStatus("Matches updated.");
    } catch (e) {
      setStatus(e.message || "Failed to find matches.");
    }
  }

  async function sendRequest(availabilityId) {
    try {
      setStatus("Sending request…");
      const body = new URLSearchParams();
      body.set("availabilityId", String(availabilityId));

      const res = await fetch(`${ctx}/buddy/request`, {
        method: "POST",
        headers: { "Content-Type": "application/x-www-form-urlencoded", Accept: "application/json" },
        body,
      });
      const data = await res.json().catch(() => ({}));
      if (!res.ok) return setStatus((data && data.message) || `Failed (${res.status})`);
      setStatus((data && data.message) || "Request sent.");
    } catch (e) {
      setStatus(e.message || "Failed to send request.");
    }
  }

  async function acceptRequest(id) {
    try {
      setStatus("Accepting request…");
      const res = await fetch(`${ctx}/buddy/request/${id}/accept`, { method: "POST", headers: { Accept: "application/json" } });
      const data = await res.json().catch(() => ({}));
      if (!res.ok) return setStatus((data && data.message) || `Failed (${res.status})`);
      setStatus((data && data.message) || "Accepted.");

      // Purpose: open in-app chat window after accept.
      if (data && data.chatUrl) {
        window.location.href = ctx + data.chatUrl;
      }
    } catch (e) {
      setStatus(e.message || "Failed to accept.");
    }
  }

  async function rejectRequest(id) {
    try {
      setStatus("Rejecting request…");
      const res = await fetch(`${ctx}/buddy/request/${id}/reject`, { method: "POST", headers: { Accept: "application/json" } });
      const data = await res.json().catch(() => ({}));
      if (!res.ok) return setStatus((data && data.message) || `Failed (${res.status})`);
      setStatus((data && data.message) || "Rejected.");
    } catch (e) {
      setStatus(e.message || "Failed to reject.");
    }
  }

  // Purpose: initial render from server-rendered boot data.
  const boot = window.__BUDDY_BOOT__ || {};
  renderIncoming(boot.incoming || []);
  renderOutgoing(boot.outgoing || []);

  startBtn?.addEventListener("click", startBuddy);
  stopBtn?.addEventListener("click", stopBuddy);
  findBtn?.addEventListener("click", findMatches);
})();

