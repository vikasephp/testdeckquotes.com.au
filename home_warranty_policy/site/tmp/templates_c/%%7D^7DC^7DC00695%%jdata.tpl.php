<?php /* Smarty version 2.6.20, created on 2025-07-22 22:12:29
         compiled from default/jdata.tpl */ ?>
<script type="text/javascript" language="javascript" src="<?php echo $this->_tpl_vars['BASE_URL']; ?>
/js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="<?php echo $this->_tpl_vars['BASE_URL']; ?>
js/jquery.min.js"></script>
<script type="text/javascript" src="<?php echo $this->_tpl_vars['BASE_URL']; ?>
js/calendar/datepicker.js"></script>
<script type="text/javascript" src="<?php echo $this->_tpl_vars['BASE_URL']; ?>
js/default.js"></script>
<script type="text/javascript" src="<?php echo $this->_tpl_vars['BASE_URL']; ?>
js/tree/simpletreemenu.js"></script>
<link rel="stylesheet" type="text/css" href="<?php echo $this->_tpl_vars['BASE_URL']; ?>
js/tree/simpletree.css" />
	<script>
		!window.jQuery && document.write('<script src="<?php echo $this->_tpl_vars['BASE_URL']; ?>
js/fancybox/jquery-1.4.3.min.js"><\/script>');
	</script>
<script type="text/javascript" src="<?php echo $this->_tpl_vars['BASE_URL']; ?>
js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="<?php echo $this->_tpl_vars['BASE_URL']; ?>
js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<script type="text/javascript" >  
		$(document).ready(function() {
			$(".various").fancybox({
				'width': '90%',
				'height': '90%',
				'autoScale': false,
				 'transitionIn' : 'elastic',
				 'transitionOut' : 'elastic',
				 'speedIn' : 300,
				 'speedOut' : 300,
				 'overlayShow' : true,
				 'hideOnOverlayClick':false,
				 'hideOnContentClick':false,
				 'type': 'iframe',
				 'scrolling': 'yes' 
			});
			
			$(".various2").fancybox({
				'autoScale': true,
				 'transitionIn' : 'elastic',
				 'transitionOut' : 'elastic',
				 'speedIn' : 300,
				 'speedOut' : 300,
				 'overlayShow' : true,
				 'hideOnOverlayClick':false,
				 'hideOnContentClick':false,
				 'scrolling': 'no' 
			});
			
			$(".various3").fancybox({
				'width': '95%',
				'height': '95%',
				'autoScale': false,
				 'transitionIn' : 'elastic',
				 'transitionOut' : 'elastic',
				 'speedIn' : 300,
				 'speedOut' : 300,
				 'overlayShow' : true,
				 'hideOnOverlayClick':false,
				 'hideOnContentClick':false,
				 'type': 'iframe',
				 'scrolling': 'yes' 
			});
			
			
			$(".view").fancybox({
				'autoScale': true,
				 'transitionIn' : 'elastic',
				 'transitionOut' : 'elastic',
				 'speedIn' : 300,
				 'speedOut' : 300,
				 'overlayShow' : true,
				 'hideOnOverlayClick':false,
				 'hideOnContentClick':false,
				 'scrolling': 'yes' 
			});			
		});
$(document).ready(function() {
		$(".fancybox").fancybox();
	});
	
function add_new(URL)
 {
var viewurl = URL+ "/random/" + Math.random();	
 $(document).ready(function () {
        $.fancybox({
				'width': '90%',
				'height': '90%',
				'autoScale': false,
				 'transitionIn' : 'elastic',
				 'transitionOut' : 'elastic',
				 'speedIn' : 300,
				 'speedOut' : 300,
				 'overlayShow' : true,
				 'overlayColor' : '#000',
				 'hideOnOverlayClick':false,
				 'hideOnContentClick':false,
				 'type': 'iframe',
				 'href': viewurl,
				 'scrolling': 'yes' 
			
        });
		

});
}
function close_win()
	{
	$.fancybox.close();
	window.location.href = window.location.href;
	}
</script>

<style>
		#fancybox-inner{
			 overflow:scroll;
		    -webkit-overflow-scrolling: touch;
}

 #TheFancybox {
     overflow:auto;
     -webkit-overflow-scrolling:touch;
     width: 100%;
     height: 100%;  
    }
#fancybox-content {
 	overflow:auto;
     -webkit-overflow-scrolling:touch;
     width: 100%;
     height: 100%; 
 }
</style>