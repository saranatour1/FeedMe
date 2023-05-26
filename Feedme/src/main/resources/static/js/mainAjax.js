// this is the same example from mdn, with my edits to it 
//https://developer.mozilla.org/en-US/docs/Web/Guide/AJAX/Getting_Started
// the purpose of this is to open a connection from the main about us page to  the next pages without having to reload the page. 
// the requests on the network were reduced, hence this approach works.
// next we need to add ajax  to the successfull sign in and sign up proccess. 
(() => {
  let httpRequest;

  document.getElementById("ajaxButton").addEventListener("mouseover", makeRequest);
  document.getElementById("signUpAjax").addEventListener("mouseover", makeRequest);

  function makeRequest() {
    
    
    httpRequest = new XMLHttpRequest();

    if (!httpRequest) {
      alert("Giving up :( Cannot create an XMLHTTP instance");
      return false;
    }

    httpRequest.onreadystatechange = alertContents;

    if (this.id === "ajaxButton") {
      document.getElementById("ajaxButton").removeEventListener("mouseover", makeRequest);
      // Handle ajaxButton click
      httpRequest.open("GET", "/login");
    } else if (this.id === "signUpAjax") {
      // Handle signUpAjax click
      document.getElementById("signUpAjax").removeEventListener("mouseover", makeRequest);
      httpRequest.open("GET", "/register");
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
