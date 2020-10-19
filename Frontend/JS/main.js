        
<!--<script src="//cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.7/ScrollMagic.min.js"></script> <!-- animation scroll -->

$(document).ready.(function(){

	var controller = new ScrollMagic.Controller();

	var ourScene = new ScrollMagic.Scene({
		triggerElement:'.container my-5 py-5'
	})

	.setClassToggle('.container my-5 py-5','fade-in')
	.addTo(controller) ; 

});