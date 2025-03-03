$(function () {
    window.addEventListener("message", function (event) {
        var item = event.data;

        
        if (event.data.transactionType == "playSound") {
            audioPlayer = new Audio("./sounds/" + event.data.transactionFile + ".ogg");
            audioPlayer.volume = event.data.transactionVolume;
            audioPlayer.play();
          }
    });
});


