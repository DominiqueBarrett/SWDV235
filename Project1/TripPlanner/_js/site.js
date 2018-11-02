	function printToday() {
	  var today = new Date();
	  document.write(today.toDateString());
	}


	"use strict";
	var $ = function(id) {
	  return document.getElementById(id);
	};
	var calculateMpg = function(miles, gallons) {
	  var mpg = (miles / gallons);
	  mpg = mpg.toFixed(1);
	  return mpg;
	};
	var processEntries = function() {
	  var miles = parseFloat($("miles").value);
	  var gallons = parseFloat($("milesPerGallons").value);


	  if (isNaN(miles)) {
	    alert("Miles must be numeric");
	    $("miles").focus();
	  } else if (miles <= 0) {
	    alert("Miles must be greater than zero");
	    $("miles").focus();
	  } else if (isNaN(gallons)) {
	    alert("Gallons must be numeric");
	    $("milesPerGallons").focus();
	  } else if (gallons <= 0) {
	    alert("gallons must be greater than zero");
	    $("milesPerGallons").focus();
	  } else {
	    $("mpg").value = calculateMpg(miles, gallons);
	  }
	};

	var submitContact = function() {
	  var Firstname = $("firstname").value;
	  var Lastname = $("lastname").value;
	  var Emailaddress = $("emailaddress").value;
	  var Phonenumber = $("phonenumber").value;

	  if (Firstname.length < 2) {
	    alert("First Name must be at least 2 characters long.");
	    $("firstname").focus();
	    return;
	  } else if (Lastname.length < 2) {
	    alert("Last Name must be at least 2 characters long");
	    $("lastname").focus();
	    return;
	  } else if (!validateEmail(Emailaddress)) {
	    alert("Email address must be valid");
	    $("emailaddress").focus();
	    return;
	  } else if (!validatePhoneNumber(Phonenumber)) {
	    alert("Phone Number is not of the form (XXX) XXX-XXXX");
	    $("phonenumber").focus();
	    return;
	  }
	  alert('Thank you for contacting us.  We will reply within the next 48 hours');
	};

	var submitNewsletter = function() {
	  var Firstname = $("firstname").value;
	  var Lastname = $("lastname").value;
	  var Emailaddress = $("emailaddress").value;
	  var today = new Date();

	  if (Firstname.length < 2) {
	    alert("First Name must be at least 2 characters long.");
	    $("firstname").focus();
	    return;
	  } else if (Lastname.length < 2) {
	    alert("Last Name must be at least 2 characters long");
	    $("lastname").focus();
	    return;
	  } else if (!validateEmail(Emailaddress)) {
	    alert("Email address must be valid");
	    $("emailaddress").focus();
	    return;
	  }
	  alert('You have signed up on ' + today.toDateString() + ' You will get your first Newsletter one week after you sign up!!');
	};
//validation for the email
	function validateEmail(email) {
	  var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	  return re.test(String(email).toLowerCase());
	}
//validation for the phone number
	function validatePhoneNumber(phonenumber) {
	  var re = /^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$/im;
	  return re.test(String(phonenumber).toLowerCase());
	}

	var $ = function(id) {
	  return document.getElementById(id);
	};

	var imageCache = [];
	var imageCounter = 0;
	var timer;

	var runSlideShow = function() {
	  imageCounter = (imageCounter + 1) % imageCache.length;
	  var image = imageCache[imageCounter];
	  $("image").src = image.src;
	  $("caption").firstChild.nodeValue = image.title;
	};

function indexSlideShow(){
	var listNode = $("image_list"); // the ul element
	var links = listNode.getElementsByTagName("a");

	// Preload images, copy title properties, and store in array
	var i, link, image;
	for (i = 0; i < links.length; i++) {
		link = links[i];
		image = new Image();
		image.src = link.getAttribute("href");
		image.title = link.getAttribute("title");
		imageCache[imageCache.length] = image;
	}

	// Attach start and pause event handlers
	$("start").onclick = function() {
		// disable start button, enable pause button,
		// run slide show, and start timer to change
		// slide every 2 seconds
		runSlideShow();
		timer = setInterval(runSlideShow, 6000);
		$("start").setAttribute("disabled", "true");
		$("pause").removeAttribute("disabled");
	};
	$("pause").onclick = function() {
		// cancel timer, disable pause button,
		// and enable start button
		clearInterval(timer);
		$("start").removeAttribute("disabled");
		$("pause").setAttribute("disabled", "true");
	};
};

function FAQShowHide(){
	$('.answer').hide();
	$('.main h2').click(function() {
	 var $answer = $(this).next('.answer');
	 if ($answer.is(':hidden')) {
		 $answer.slideDown();
		 $(this).addClass('close');
	 } else {
		 $answer.fadeOut();
		 $(this).removeClass('close');
	 }
	}
	 ); // end click
}
