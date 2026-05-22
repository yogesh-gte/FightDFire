
setInterval(() => {
    fetch('/sos/alerts')
        .then(response => response.json())
        .then(data => {
            if (data.sosActive) {
                playSiren();
                alert("🚨 SOS Alert! Someone nearby needs help.");
            }
        });
}, 5000);

function playSiren() {
    let audio = new Audio('/siren.mp3'); 
    audio.play();
}
