// Since there already is a route  that handles the requests, we will use ajax on successfull sign in and sign up
// sign in
(() => {
  let httpRequest;

  document.getElementById("ajaxButton").addEventListener("click", makeRequest);
  // document.getElementById("signUpAjax").addEventListener("mouseover", makeRequest);

  function makeRequest() {
    
    
    httpRequest = new XMLHttpRequest();

    if (!httpRequest) {
      alert("Giving up :( Cannot create an XMLHTTP instance");
      return false;
    }

    httpRequest.onreadystatechange = alertContents;

    if (this.id === "ajaxButton") {
      document.getElementById("ajaxButton").removeEventListener("click", makeRequest);
      // Handle ajaxButton click
      httpRequest.open("GET", "/resturants");
    } 
    httpRequest.send();
  }

  function alertContents() {
    if (httpRequest.readyState === XMLHttpRequest.DONE) {
      if (httpRequest.status === 200) {
        console.log(httpRequest.responseText);
      } else {
        console.log("There was a problem with the request.");
      }
    }
  }
})();