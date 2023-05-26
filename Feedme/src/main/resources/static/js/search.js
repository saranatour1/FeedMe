const form = document.getElementById('searchForm');
const input = document.querySelector('input[type="search"]');

form.addEventListener('submit', function(event) {
  event.preventDefault();

  const restName = input.value.trim();
  console.log(restName);

  if (restName !== '') {
    makeRequest(restName);
  }
});

function makeRequest(restName) {
  const httpRequest = new XMLHttpRequest();

  if (!httpRequest) {
    alert("Giving up :( Cannot create an XMLHTTP instance");
    return false;
  }

  httpRequest.onreadystatechange = function() {
    if (httpRequest.readyState === XMLHttpRequest.DONE) {
      if (httpRequest.status === 200) {
        console.log(httpRequest.responseText);
        

      } else {
        // Request failed
        console.log("There was a problem with the request.");
      }
    }
  };

  httpRequest.open("POST", "/findresturantbyname", true);
  httpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

  const params = `restName=${encodeURIComponent(restName)}`;
  httpRequest.send(params);
}
