<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Incident Heatmap – Admin</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"/>
<style>
:root {
  --maroon:        #7d2a5a;
  --maroon-light:  #a0375e;
  --maroon-dark:   #5a1d40;
  --maroon-pale:   #f6f0f4;
  --maroon-border: rgba(125,42,90,0.18);
  --shadow-sm: 0 6px 20px rgba(125,42,90,0.10);
  --sidebar-w: 272px;
  
  --pp: var(--maroon);
  --ppl: var(--maroon-light);
  --bg: var(--maroon-pale);
}
*{box-sizing:border-box;}
body{font-family:'Poppins',sans-serif;margin:0;background:var(--bg);}
.topbar{background:var(--pp);color:#fff;padding:14px 18px;font-weight:600;position:sticky;top:0;z-index:1000;box-shadow:var(--sh);display:flex;align-items:center;justify-content:space-between;gap:12px;}
.topbar .title{font-size:1.2rem;margin:0;}
.layout{display:flex;min-height:calc(100vh - 56px);}
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
.main{flex:1;min-width:0;padding:24px 20px;}
.stats-bar{display:flex;gap:12px;flex-wrap:wrap;margin-bottom:18px;}
.sp{background:#fff;border-radius:12px;padding:10px 18px;box-shadow:var(--sh);border:1px solid rgba(123,44,191,.14);display:flex;align-items:center;gap:8px;font-weight:600;font-size:.9rem;}
.sp i{color:var(--ppl);}
.sp .cnt{font-size:1.3rem;font-weight:700;color:var(--pp);}
.fbar{background:#fff;border-radius:12px;padding:14px 18px;box-shadow:var(--sh);border:1px solid rgba(123,44,191,.14);display:flex;gap:10px;flex-wrap:wrap;align-items:center;margin-bottom:16px;}
.fbar select{border:1px solid rgba(123,44,191,.3);border-radius:8px;padding:6px 12px;font-family:'Poppins',sans-serif;font-size:.88rem;outline:none;}
.fbar label{font-weight:600;font-size:.85rem;color:#374151;margin:0;}
.btnp{background:var(--pp);color:#fff;border:none;padding:7px 16px;border-radius:8px;font-weight:600;font-size:.88rem;cursor:pointer;}
.btnp:hover{background:var(--ppl);}
#heatmap{width:100%;height:560px;border-radius:16px;overflow:hidden;box-shadow:var(--shm);border:2px solid rgba(123,44,191,.2);}
.legend{background:#fff;border-radius:12px;padding:14px 18px;box-shadow:var(--sh);border:1px solid rgba(123,44,191,.14);margin-top:16px;}
.legend h6{font-weight:700;color:var(--pp);margin-bottom:10px;}
.li{display:flex;align-items:center;gap:8px;margin-bottom:6px;font-size:.85rem;}
.ld{width:14px;height:14px;border-radius:50%;flex-shrink:0;}
.twrap{background:#fff;border-radius:14px;padding:18px;box-shadow:var(--sh);border:1px solid rgba(123,44,191,.14);margin-top:20px;overflow-x:auto;}
.twrap h6{font-weight:700;color:var(--pp);margin-bottom:14px;}
table{width:100%;border-collapse:collapse;font-size:.85rem;}
th{background:rgba(123,44,191,.07);color:var(--pp);font-weight:700;padding:10px 12px;text-align:left;}
td{padding:9px 12px;border-bottom:1px solid #f3f0f8;}
tr:hover td{background:rgba(123,44,191,.03);}
.bh{padding:3px 8px;border-radius:999px;font-size:.75rem;font-weight:600;}
.bh-HARASSMENT{background:#fee2e2;color:#b91c1c;}
.bh-ASSAULT{background:#fef3c7;color:#92400e;}
.bh-THEFT{background:#dbeafe;color:#1e40af;}
.bh-OTHER{background:#f3f4f6;color:#374151;}
.nodata{background:#fff;border-radius:14px;padding:40px;text-align:center;box-shadow:var(--sh);border:1px solid rgba(123,44,191,.14);color:#6b7280;}
.nodata i{font-size:2.5rem;color:var(--ppl);margin-bottom:12px;}
.infobar{padding:9px 14px;border-radius:8px;font-size:.82rem;margin-bottom:12px;display:none;}
.infobar.warn{background:#fef3c7;border:1px solid #fcd34d;color:#92400e;}
.infobar.pin{background:#7c3aed;color:#fff;font-weight:600;cursor:pointer;}
.infobar.ok{background:#dcfce7;border:1px solid #86efac;color:#166534;}
.pinbtn{background:#7c3aed;color:#fff;border:none;border-radius:6px;padding:3px 9px;font-size:.75rem;cursor:pointer;margin-top:2px;}
@media(max-width:992px){.layout{flex-direction:column;}.sidebar{width:100%;position:relative;height:auto;}}
@media(max-width:768px){#heatmap{height:380px;}}
::-webkit-scrollbar{width:6px;}::-webkit-scrollbar-thumb{background:var(--ppl);border-radius:10px;}
</style>
</head>
<body>

<div class="topbar">
  <p class="title"><i class="fas fa-map-marked-alt me-2"></i>Incident Heatmap</p>
  <div style="display:flex;gap:10px;align-items:center;flex-wrap:wrap;">
    <span style="font-size:.88rem;opacity:.85;">Real-time safety hotspot view</span>
    <a href="${pageContext.request.contextPath}/admin/adminDashboard" style="background:#fff;color:#7C2D5E;padding:6px 14px;border-radius:8px;text-decoration:none;font-weight:600;font-size:.85rem;">&#8592; Dashboard</a>
    <a href="${pageContext.request.contextPath}/admin/logout" style="background:rgba(255,255,255,.2);color:#fff;padding:6px 14px;border-radius:8px;text-decoration:none;font-weight:600;font-size:.85rem;">Logout</a>
  </div>
</div>

<div class="layout">
  <%@ include file="globalAdminMenu.jsp" %>

  <main class="main">

    <!-- Stats -->
    <div class="stats-bar">
      <div class="sp"><i class="fas fa-map-pin"></i><div><div class="cnt" id="totalCount">–</div><div style="font-size:.75rem;color:#6b7280;">Total</div></div></div>
      <div class="sp"><i class="fas fa-exclamation-circle" style="color:#b91c1c"></i><div><div class="cnt" id="harassCount">–</div><div style="font-size:.75rem;color:#6b7280;">Harassment</div></div></div>
      <div class="sp"><i class="fas fa-fist-raised" style="color:#92400e"></i><div><div class="cnt" id="assaultCount">–</div><div style="font-size:.75rem;color:#6b7280;">Assault</div></div></div>
      <div class="sp"><i class="fas fa-wallet" style="color:#1e40af"></i><div><div class="cnt" id="theftCount">–</div><div style="font-size:.75rem;color:#6b7280;">Theft</div></div></div>
      <div class="sp"><i class="fas fa-dot-circle" style="color:#374151"></i><div><div class="cnt" id="otherCount">–</div><div style="font-size:.75rem;color:#6b7280;">Other</div></div></div>
    </div>

    <!-- Info bars (JS-created, inserted before map) -->
    <div id="pinBanner" class="infobar pin" style="display:none;">
      <i class="fas fa-crosshairs me-2"></i>PIN MODE — Click anywhere on the map to place this incident's location.
      <span onclick="cancelPin()" style="text-decoration:underline;margin-left:12px;cursor:pointer;">Cancel</span>
    </div>
    <div id="infoBar" class="infobar warn"></div>

    <!-- Filters -->
    <div class="fbar">
      <label>Type:</label>
      <select id="typeFilter">
        <option value="ALL">All Types</option>
        <option value="HARASSMENT">Harassment</option>
        <option value="ASSAULT">Assault</option>
        <option value="THEFT">Theft</option>
        <option value="OTHER">Other</option>
      </select>
      <label>Status:</label>
      <select id="statusFilter">
        <option value="ALL">All Statuses</option>
        <option value="PENDING">Pending</option>
        <option value="RESOLVED">Resolved</option>
        <option value="ACTION_TAKEN">Action Taken</option>
      </select>
      <button class="btnp" onclick="applyFilters()"><i class="fas fa-filter"></i> Apply</button>
      <button class="btnp" style="background:#6b7280;" onclick="resetFilters()"><i class="fas fa-undo"></i> Reset</button>
      <span id="filterNote" style="font-size:.8rem;color:#6b7280;"></span>
    </div>

    <!-- Map -->
    <div id="heatmap"></div>

    <!-- Legend -->
    <div class="legend">
      <h6><i class="fas fa-info-circle me-2"></i>Legend</h6>
      <div style="display:flex;flex-wrap:wrap;gap:18px;">
        <div class="li"><div class="ld" style="background:#ef4444;"></div>Harassment</div>
        <div class="li"><div class="ld" style="background:#f97316;"></div>Assault</div>
        <div class="li"><div class="ld" style="background:#3b82f6;"></div>Theft</div>
        <div class="li"><div class="ld" style="background:#4c1d95;"></div>Poor Lighting</div>
        <div class="li"><div class="ld" style="background:#7c2d5e;"></div>Verified Danger</div>
        <div class="li" style="margin-left:auto;font-size:.8rem;color:#6b7280;"><i class="fas fa-fire me-1" style="color:#ef4444;"></i>Hotter = more incidents</div>
      </div>
    </div>

    <!-- Table -->
    <div class="twrap" id="tableWrap" style="display:none;">
      <h6><i class="fas fa-table me-2"></i>All Incidents</h6>
      <table>
        <thead>
          <tr><th>#</th><th>Type</th><th>Location</th><th>Lat</th><th>Lng</th><th>Source</th><th>Status</th><th>Date</th></tr>
        </thead>
        <tbody id="tableBody"></tbody>
      </table>
    </div>

    <div class="nodata" id="noDataNotice" style="display:none;">
      <i class="fas fa-map-marked-alt d-block"></i>
      <h5>No incidents on map yet</h5>
      <p>Use the <b>📍 Pin Location</b> button in the table below to manually place an incident on the map.</p>
    </div>

  </main>
</div>

<script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>
<script src="https://unpkg.com/leaflet.heat@0.2.0/dist/leaflet-heat.js"></script>
<script>
(function(){
  var CTX = '${pageContext.request.contextPath}';
  var TC  = { 
      HARASSMENT:'#ef4444', 
      ASSAULT:'#f97316', 
      THEFT:'#3b82f6', 
      OTHER:'#6b7280',
      POOR_LIGHTING:'#4c1d95',
      ISOLATED_AREA:'#92400e',
      DANGER_POINT:'#7c2d5e'
  };

  var rawData=[], allData=[], markers=[], heatLayer=null;
  var pinMode=false, pinTarget=null;

  /* ── map ── */
  var map = L.map('heatmap',{zoomControl:true}).setView([20.5937,78.9629],5);
  L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',{
    attribution:'&copy; OpenStreetMap', maxZoom:18
  }).addTo(map);

  /* ── pin-mode map click ── */
  map.on('click',function(e){
    if(!pinMode||!pinTarget) return;
    var lat=e.latlng.lat, lng=e.latlng.lng;
    showInfo('warn','<i class="fas fa-spinner fa-spin me-2"></i>Getting address for clicked location…');
    fetch('https://nominatim.openstreetmap.org/reverse?format=json&lat='+lat+'&lon='+lng+'&zoom=16')
      .then(function(r){return r.json();})
      .then(function(g){ savePin(pinTarget,lat,lng,(g&&g.display_name)?g.display_name:(lat.toFixed(5)+', '+lng.toFixed(5))); })
      .catch(function(){ savePin(pinTarget,lat,lng,lat.toFixed(5)+', '+lng.toFixed(5)); });
  });

  function savePin(d,lat,lng,addr){
    var p=new URLSearchParams();
    p.append('latitude',lat); p.append('longitude',lng); p.append('location',addr);
    fetch(CTX+'/admin/incidents/'+d.id+'/location',{
      method:'POST', headers:{'Content-Type':'application/x-www-form-urlencoded'}, body:p.toString()
    })
    .then(function(r){return r.json();})
    .then(function(res){
      if(res.ok){
        d.lat=lat; d.lng=lng; d.location=addr; d.hasGps=true;
        if(!allData.find(function(x){return x.id===d.id;})) allData.push(d);
        addMarker(d); rebuildHeat();
        map.setView([lat,lng],14);
        renderTable(rawData);
        showInfo('ok','<i class="fas fa-check-circle me-2"></i>Location saved: '+addr.substring(0,70));
        setTimeout(function(){document.getElementById('infoBar').style.display='none';},4000);
      }
    }).catch(function(e){console.error(e);});
    cancelPin();
  }

  window.cancelPin=function(){
    pinMode=false; pinTarget=null;
    document.getElementById('pinBanner').style.display='none';
    map.getContainer().style.cursor='';
  };

  window.startPin=function(id){
    var d=rawData.find(function(x){return x.id==id;});
    if(!d)return;
    pinTarget=d; pinMode=true;
    document.getElementById('pinBanner').style.display='block';
    map.getContainer().style.cursor='crosshair';
    document.getElementById('heatmap').scrollIntoView({behavior:'smooth',block:'center'});
  };

  function showInfo(type,html){
    var b=document.getElementById('infoBar');
    b.className='infobar '+type; b.innerHTML=html; b.style.display='block';
  }

  /* ── fetch data ── */
  fetch(CTX+'/admin/heatmap.json',{headers:{Accept:'application/json'}})
  .then(function(r){return r.json();})
  .then(function(data){
    rawData=data;
    updateStats(data);
    renderTable(data);
    if(!data||data.length===0){document.getElementById('noDataNotice').style.display='block';return;}

    var withGps   =data.filter(function(d){return d.hasGps;});
    var needsGeo  =data.filter(function(d){return !d.hasGps&&d.location&&d.location.trim()!=='';});
    var noLoc     =data.filter(function(d){return !d.hasGps&&(!d.location||d.location.trim()==='');});

    allData=withGps.slice();
    if(allData.length>0){ renderMap(allData); }

    if(noLoc.length>0){
      showInfo('warn','<i class="fas fa-exclamation-triangle me-2"></i>'+noLoc.length+
        ' incident(s) have <b>no location</b>. Use the <b>📍 Pin Location</b> button in the table to place them on the map.');
    }
    if(needsGeo.length>0) geocodeSeq(needsGeo,0);
  })
  .catch(function(e){console.error('Heatmap fetch error:',e);});

  /* ── geocode text locations via Nominatim ── */
  function geocodeSeq(list,idx){
    if(idx>=list.length){
      showInfo('ok','<i class="fas fa-check-circle me-2"></i>Geocoding complete — all text locations resolved.');
      setTimeout(function(){document.getElementById('infoBar').style.display='none';},3000);
      if(allData.length>0) renderMap(allData);
      return;
    }
    var d=list[idx];
    showInfo('warn','<i class="fas fa-spinner fa-spin me-2"></i>Geocoding '+(idx+1)+'/'+list.length+': '+d.location.substring(0,50)+'…');
    /* No countrycodes restriction — works for any Indian address */
    fetch('https://nominatim.openstreetmap.org/search?format=json&q='+encodeURIComponent(d.location)+'&limit=1',
          {headers:{'Accept-Language':'en'}})
    .then(function(r){return r.json();})
    .then(function(res){
      if(res&&res.length>0){
        d.lat=parseFloat(res[0].lat); d.lng=parseFloat(res[0].lon); d.hasGps=true;
        allData.push(d);
        addMarker(d); rebuildHeat();
        if(allData.length===1) map.setView([d.lat,d.lng],13);
        else map.fitBounds(L.latLngBounds(allData.map(function(x){return[x.lat,x.lng];})),{padding:[30,30]});
      }
    })
    .catch(function(){})
    .finally(function(){ setTimeout(function(){geocodeSeq(list,idx+1);},350); });
  }

  /* ── marker ── */
  function addMarker(d){
    var c=TC[d.type]||'#6b7280';
    var m=L.circleMarker([d.lat,d.lng],{radius:9,color:c,fillColor:c,fillOpacity:.8,weight:2}).addTo(map);
    m.bindPopup(
      '<div style="font-family:Poppins,sans-serif;min-width:210px;">'+
      '<b style="color:#7C2D5E;font-size:1rem;">'+(d.type||'Incident')+'</b>'+
      '<hr style="margin:4px 0;border-color:#eee;">'+
      '<small><b>&#128205; Location:</b> '+(d.location||'Unknown')+'</small><br>'+
      '<small><b>&#9889; Status:</b> '+(d.status||'–')+'</small><br>'+
      (d.description?'<small><b>&#128221;</b> '+d.description.substring(0,100)+'</small><br>':'')+
      '<small style="color:#9ca3af;">&#128197; '+(d.reportedAt?d.reportedAt.substring(0,10):'–')+'</small>'+
      '</div>'
    );
    markers.push(m);
  }

  function rebuildHeat(){
    if(heatLayer){map.removeLayer(heatLayer);heatLayer=null;}
    if(!allData.length)return;
    heatLayer=L.heatLayer(allData.map(function(d){return[d.lat,d.lng,1];}),
      {radius:35,blur:28,maxZoom:13,gradient:{0.2:'blue',0.45:'lime',0.65:'yellow',1:'red'}}).addTo(map);
  }

  function renderMap(data){
    markers.forEach(function(m){map.removeLayer(m);}); markers=[];
    if(heatLayer){map.removeLayer(heatLayer);heatLayer=null;}
    var mp=data.filter(function(d){return d.lat!=null&&d.lng!=null;});
    if(!mp.length) return;
    mp.forEach(function(d){addMarker(d);});
    heatLayer=L.heatLayer(mp.map(function(d){return[d.lat,d.lng,1];}),
      {radius:35,blur:28,maxZoom:13,gradient:{0.2:'blue',0.45:'lime',0.65:'yellow',1:'red'}}).addTo(map);
    map.fitBounds(L.latLngBounds(mp.map(function(d){return[d.lat,d.lng];})),{padding:[40,40],maxZoom:13});
  }

  function updateStats(data){
    document.getElementById('totalCount').textContent  =data.length;
    document.getElementById('harassCount').textContent =data.filter(function(d){return d.type==='HARASSMENT';}).length;
    document.getElementById('assaultCount').textContent=data.filter(function(d){return d.type==='ASSAULT';}).length;
    document.getElementById('theftCount').textContent  =data.filter(function(d){return d.type==='THEFT';}).length;
    document.getElementById('otherCount').textContent  =data.filter(function(d){return!['HARASSMENT','ASSAULT','THEFT'].includes(d.type);}).length;
  }

  function renderTable(data){
    var tb=document.getElementById('tableBody');
    tb.innerHTML='';
    if(!data||!data.length) return;
    data.forEach(function(d,i){
      var src=d.source === 'DANGER_POINT'
        ?'<span style="color:#7c2d5e;font-size:.75rem;"><i class="fas fa-shield-alt"></i> Verified Danger</span>'
        :(d.hasGps
          ?'<span style="color:#16a34a;font-size:.75rem;"><i class="fas fa-satellite-dish"></i> GPS Report</span>'
          :(d.location&&d.location.trim()!==''
            ?'<span style="color:#d97706;font-size:.75rem;"><i class="fas fa-font"></i> Text Report</span>'
            :'<span style="color:#ef4444;font-size:.75rem;"><i class="fas fa-question-circle"></i> No Loc</span>'));
      var latV=d.lat!=null?parseFloat(d.lat).toFixed(5):'–';
      var lngV=d.lng!=null?parseFloat(d.lng).toFixed(5):'–';
      var pin=!d.hasGps
        ?'<br><button class="pinbtn" onclick="startPin('+d.id+')">&#128205; Pin Location</button>'
        :'';
      tb.insertAdjacentHTML('beforeend',
        '<tr>'+
        '<td>'+(i+1)+'</td>'+
        '<td><span class="bh bh-'+(d.type||'OTHER')+'">'+(d.type||'OTHER')+'</span></td>'+
        '<td style="max-width:180px;"><div style="overflow:hidden;text-overflow:ellipsis;white-space:nowrap;" title="'+(d.location||'')+'">'+(d.location||'<span style="color:#9ca3af;font-style:italic;">No location</span>')+'</div>'+pin+'</td>'+
        '<td>'+latV+'</td>'+
        '<td>'+lngV+'</td>'+
        '<td>'+src+'</td>'+
        '<td>'+(d.status||'–')+'</td>'+
        '<td>'+(d.reportedAt?d.reportedAt.substring(0,10):'–')+'</td>'+
        '</tr>'
      );
    });
    document.getElementById('tableWrap').style.display='block';
  }

  window.applyFilters=function(){
    var t=document.getElementById('typeFilter').value;
    var s=document.getElementById('statusFilter').value;
    var f=allData.filter(function(d){return(t==='ALL'||d.type===t)&&(s==='ALL'||(d.status||'PENDING')===s);});
    renderMap(f);
    document.getElementById('filterNote').textContent='Showing '+f.length+' of '+allData.length+' mapped';
    document.getElementById('noDataNotice').style.display=f.length===0?'block':'none';
  };
  window.resetFilters=function(){
    document.getElementById('typeFilter').value='ALL';
    document.getElementById('statusFilter').value='ALL';
    renderMap(allData);
    document.getElementById('filterNote').textContent='';
    document.getElementById('noDataNotice').style.display=allData.length===0?'block':'none';
  };
})();
</script>
</body>
</html>

