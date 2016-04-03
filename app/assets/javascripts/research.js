var bookadvsection = "<label for='researches_ISBN'>ISBN:</label>" 
                    +"<input id='researches_ISBN' name='researches[book][ISBN]' type='text'</input><br>";
var tutoringadvsection = "<label for='researches_course'>course:</label>" 
                    +"<input id='researches_course' name='researches[tutoring][course]' type='text'</input><br>";
var electronicadvsection = "<label for='researches_brand'>brand:</label>" 
                    +"<input id='researches_brand' name='researches[electronic][brand]' type='text'</input><br>"
                    +"<label for='researches_model'>model:</label>" 
                    +"<input id='researches_model' name='researches[electronic][model]' type='text'</input><br>";


function renderAdvancedSearche()
{
  var nodes_p = document.getElementById("researches_in");

  nodes_p.addEventListener("click",function(){
    var e = document.getElementById("researches_in");
    var advsection = document.getElementById("advsearch");
    advsection.innerHTML = '';
    if( e.selectedIndex == 1){
      advsection.innerHTML += bookadvsection;
    }
    if( e.selectedIndex == 2){
      advsection.innerHTML += electronicadvsection;
    }
    if( e.selectedIndex == 3){
      advsection.innerHTML += tutoringadvsection;
    }
  });

}
window.onload=function() {
  renderAdvancedSearche();
}
