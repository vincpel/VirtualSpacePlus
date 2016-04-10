//alert("lol");

//class comment
function Comment(adid, message, anno){
	this.adid = adid;
	this.message = message;
	this.anno = anno;
};

Comment.prototype.all = function(){
	//// TODO xhrrequest. GET /ads/4/comments
	var xid = $("#addid").text();
	//var comments;
	$get({
		dataType: "application/json",
		url: "/comments",
		data: {ad_id: xid},
		success: function(result){
			comments = results;
    	}
	});
};

Comment.prototype.save = function(){
	
 //var acomment = {"id":"John", "textcomment":"Doe"};
//var comment1 = new Comment();

	//var data = JSON.stringify(this);
    $.post({ 
    	     dataType: "application/json",
    		 url: "/comments.json", 
    		 data:  {text: this.message, ad_id: this.adid, anno: this.anno },
    		 function(result){
				alert("ok");
    		 }
    });
};



//class commentController
var CommentConttroler = function(){
	this.comments = null;
};

CommentConttroler.prototype.show = function(){
  var xid = $("#addid").text();
  //xid = JSON.stringify(xid);
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (xhttp.readyState == 4 && xhttp.status == 200) {
      var result = xhttp.responseText;
      renderAllComments(result);
    }
  };
  xhttp.open("GET", "/comments.json?ad_id="+xid, true);
  xhttp.setRequestHeader('Content-Type', 'application/json');
  xhttp.send(xid);
  //xhttp.send(JSON.stringify({name:"John Rambo", time:"2pm"}));
	
	

	//var comments;
	//var xid = $("#addid").text();
	//$.ajax({
	//	url: "/comments.json",
	//	data: {ad_id: xid},
	//	succes: function(result){
	//		renderAllComments(result);
    //	},
    //	dataType: "application/json"
	//});
};

CommentConttroler.prototype.create = function(comment){
	// vachercher ses champ
	var ncom = $("#sendcommentform");
	var intext = $("#sendcommentform").children().eq(1).val();
	var inanno = $("#sendcommentform").children().eq(3).val();
	var infadid = $("#addid").text();
	
	//Comment(adid, message, anno)
	var newcomm = new Comment(infadid, intext, inanno);
	newcomm.save();
	
	this.show();
	
};

//comment views and bindings
function renderComments(){
		
};

function renderCommentForm(){
	var commentform = `
		<div id="sendcommentform">
			Add a comment: <br>
			<textarea name="textcomment"></textarea><br>
			dont display my email: 
			<input type="checkbox" name="annonymous"></input> <br>
			<input id="askcomment" type="submit" value="Send"></input>
		</div>`;
	$("#commentSection").append(commentform);
};

var textcom = '{"comments":[' +
'{"id":"1","textcomment":"Doe" },' +
'{"id":"2","textcomment":"Smith" },' +
'{"id":"3","textcomment":"Jones" }]}';


 var fcomments = [
    {"id":"John", "textcomment":"Doe"},
    {"id":"Anna", "textcomment":"Smith"},
    {"id":"Peter","textcomment": "Jones"}
]; 

var acomment = {"id":"John", "textcomment":"Doe"};

function renderAllComments(comments){
	var comments = JSON.parse(comments);
	var exp = 9+0;
	
	var commentlist = "";
	for(i = 0; i < comments.length; i++) {
        commentlist += "<p><b>"+ comments[i].email+"</b></p>" + "<p>"+ comments[i].text+"</p>";
    }
	
	var commentSection = `
	<div>
		<p>${commentlist}</p>
	</div>`;
	
	$("#commentSection").append(commentSection);
};




var ready = function() {

  renderCommentForm();
  
  var ccontroller = new CommentConttroler;
  $("#askcomment").click(function() {
  	ccontroller.create();
  });
  
  
  ccontroller.show();


};

$(document).ready(ready);
$(document).on('page:load', ready);
