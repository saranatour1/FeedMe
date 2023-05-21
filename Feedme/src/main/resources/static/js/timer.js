var duration = 10;
var seconds = duration;

function printSeconds() {
  var displayElement = document.getElementById('timer');
  displayElement.textContent = seconds + " second(s)";

  if (seconds <= 0) {
    window.location.href = "/restaurants";
  }
}

setInterval(function() {
  seconds--;
  printSeconds();
}, 1000);
