//alert("lol");

//class comment
function Comment(adid, message, anno){
	this.adid = adid;
	this.message = message;
	this.anno = anno;

  this.all = function(){
	  var xid = $("#addid").text();
	  $get({
	  	dataType: "application/json",
	  	url: "/comments",
	  	data: {ad_id: xid},
	  	success: function(result){
	  		comments = results;
      	}
	  });
  };

  this.save = function(){
      $.post({ 
      	dataType: "application/json",
      	url: "/comments.json", 
      	data:  {text: this.message, ad_id: this.adid, anno: this.anno },
      	function(result){
  				alert("ok");
      	}
      });
  };
};

//class commentController
var CommentConttroler = function(){
	this.comments = null;

  this.show = function(){
    var xid = $("#addid").text();
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
  };
  
  this.create = function(comment){
  	var ncom = $("#sendcommentform");
  	var intext = $("#id777").val();
  	var inanno = $("#sendcommentform").children().eq(3).val();
  	var infadid = $("#addid").text();
  	
  	var newcomm = new Comment(infadid, intext, inanno);
  	newcomm.save();
  	
  	this.show();
  };
};


function Mail(callbackinfo, mailbody, ad_id){
  this.callbackinfo = callbackinfo;
  this.mailbody = mailbody;
  this.ad_id = ad_id;
  
  this.save = function(c1, c2){
      $.post({ 
      	dataType: "application/json",
      	url: "/mail.json", 
      	data:  {captcha: c2, captchat_key: c1 ,callbackinfo: this.callbackinfo, ad_id: this.ad_id, mailbody: this.mailbody },
      }).error(function(jqxhr, status, errorThrown){ 
          if(jqxhr.status != 200){
            alert(status);
            alert("bad capcha");

          } 
        });
  };
};

function MailController(){

  this.create = function(comment){
    var c1 = $(".simple_captcha_field").children().last().val();
    var c2 = $("#captcha").val();
  	var adid = $("#addid").text();
  	var contactinfo = $("#yyu12").val();
  	var messagebody = $("#yyu13").val();
  	var newcomm = new Mail(contactinfo, messagebody,adid);
  	newcomm.save(c1, c2);
  	
  };
};

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


var acomment = {"id":"John", "textcomment":"Doe"};

function renderAllComments(comments){
	
	var comments = JSON.parse(comments);
	var commentlist = "";
	for(i = 0; i < comments.length; i++) {
    commentlist += "<div class='comment'>"+"<p><b>"+ comments[i].email+"</b></p>" + "<p>"+ comments[i].text+"</p>"+"</div>";
  }
	
	var commentSection = `
	<div id="loncomment">
		<div>${commentlist}</div>
	</div>`;
	
	$("#loncomment").remove();
  $("#commentSection").empty();
  var comhead = `<h3>Comments ... </h3>`
	$("#commentSection").append(comhead);
	$("#commentSection").append(commentSection);
};


function rendercomform(){
  var location = $(".one-fourth")
	var commentform = `
		<div id="sendcommentform" class="menu mini-menu-app">
			  <b>Add a comment:</b> <br>
			  <textarea id="id777" name="textcomment"></textarea><br>
			  dont display my email: 
			  <input id="id444" type="checkbox" name="annonymous"></input> <br>
			  <input id="askcomment" type="submit" value="Send"></input>
		</div>`;
    location.append(commentform);
};

function renderMailSender(){
  var cpt;
	$.get({
    async: false,
		url: "/captcha",
		success: function(result){
			cpt = result;
    	}
	});

  var location = $(".one-fourth")
	var commentform = `
		<div id="sendmailform" class="menu mini-menu-app">
			<b>Send A mail to seller:</b> <br>
			Leave contact: <br>
			<textarea id="yyu12" name="callbackinfo"></textarea><br>
			Email Body: <br>
			<textarea id="yyu13" name="mailbody"></textarea><br>
      ${cpt}
			<input id="askmail" type="submit" value="Send"></input>
		</div>`;

  
    location.append(commentform);
};

var ready = function() {

  if($("#apid1").length){
  
  rendercomform();
  renderMailSender();
  var ccontroller = new CommentConttroler;
  $("#askcomment").click(function() {
  	ccontroller.create();
  });

  ccontroller.show();
  var mcontroller = new MailController();
  $("#askmail").click(function() {
  	mcontroller.create();
  });
  }


};

$(document).ready(ready);
$(document).on('page:load', ready);
