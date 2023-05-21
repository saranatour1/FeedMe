var duration = 10; 
var seconds = 0;

function printSeconds() {
  var displayElement = document.getElementById('timer');
  displayElement.textContent = seconds + " second(s)";


  if (seconds >= duration) {
    window.location.href = "/resturants";
  }
}

setInterval(function() {
  seconds++;
  printSeconds();
}, 1000);