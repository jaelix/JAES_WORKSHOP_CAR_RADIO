window.addEventListener('message', function(event) {
    const data = event.data;
    const player = document.getElementById("radioPlayer");

    if (data.type === "play") {
        player.src = data.url;
        player.volume = data.volume || 0.5;
        player.play();
    } else if (data.type === "stop") {
        player.pause();
        player.src = "";
    } else if (data.type === "setVolume") {
        player.volume = data.volume;
        document.getElementById("volume").value = data.volume;
    } else if (data.type === "show") {
        document.body.style.display = "flex";
        document.getElementById("volume").value = data.volume || 0.5;
    }
});

function play() {
    const url = document.getElementById("url").value;
    const volume = parseFloat(document.getElementById("volume").value);
    fetch(`https://${GetParentResourceName()}/playSound`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ url: url, volume: volume })
    });
}

function stop() {
    fetch(`https://${GetParentResourceName()}/stopSound`, {
        method: "POST"
    });
}

function closeRadio() {
    document.body.style.display = "none";
    fetch(`https://${GetParentResourceName()}/closeRadio`, {
        method: "POST"
    });
}

function changeVolume(val) {
    fetch(`https://${GetParentResourceName()}/setVolume`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ volume: parseFloat(val) })
    });
}