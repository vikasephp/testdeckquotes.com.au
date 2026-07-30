

/* ---------- IE8 list style hack (:nth-child(odd)) ---------- */

jQuery(document).ready(function($){
	
	if($('.messagesList').width()) {
		
		if(jQuery.browser.version.substring(0, 2) == "8.") {

			$('ul.messagesList li:nth-child(2n+1)').addClass('odd');
			
		}
		
	}
	
});	

$(document).ready(function(){
		
			
	$("#username").focus(function() {
		
		$(this).parent(".input-prepend").addClass("input-prepend-focus");
	
	});
	
	$("#username").focusout(function() {
		
		$(this).parent(".input-prepend").removeClass("input-prepend-focus");
	
	});
	
	$("#password").focus(function() {
		
		$(this).parent(".input-prepend").addClass("input-prepend-focus");
	
	});
	
	$("#password").focusout(function() {
		
		$(this).parent(".input-prepend").removeClass("input-prepend-focus");
	
	});
	
				
	/* ---------- Add class .active to current link  ---------- */
	$('ul.main-menu li a').each(function(){
		
			if($($(this))[0].href==String(window.location)) {
				
				$(this).parent().addClass('active');
				
			}
	
	});
	
	$('ul.main-menu li ul li a').each(function(){
		
			if($($(this))[0].href==String(window.location)) {
				
				$(this).parent().addClass('active');
				$(this).parent().parent().show();
				
			}
	
	});
	
	/* ---------- Submenu  ---------- */
	
	$('.dropmenu').click(function(e){

		e.preventDefault();

		$(this).parent().find('ul').slideToggle();
	
	});
			
	
		/* ---------- Datapicker ---------- */
	$('.datepicker').datepicker();
	
	
});
