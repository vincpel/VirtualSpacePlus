
function pageController(method, path, op)
{
  var xhttp;
  if (window.XMLHttpRequest) {
    xhttp = new XMLHttpRequest();
  } else {
    // code for IE6, IE5
    xhttp = new ActiveXObject("Microsoft.XMLHTTP");
  }
  xhttp.onreadystatechange = function() {
    if (xhttp.readyState == 4 && xhttp.status == 200) {
       document.getElementById("demo").innerHTML = xhttp.responseText;		
    }
  }
  xhttp.open(method,path,op);
  xhttp.send();

  return;

  
}

//alert("lol.");
