	<!-- Load jQuery -->
<script type="text/javascript" src="http://www.google.com/jsapi"></script>
<!-- Load TinyMCE -->
<script type="text/javascript" src="{{$BASE_URL}}js/tiny_mce/jquery.tinymce.js"></script>
<script type="text/javascript">
	$().ready(function() {
		$('textarea.tinymce').tinymce({
			// Location of TinyMCE script
			script_url : '{{$BASE_URL}}js/tiny_mce/tiny_mce.js',
			// General options
			theme : "advanced",
			plugins : "autolink,lists,pagebreak,style,layer,table,save",
			theme_advanced_buttons1 : "cut,copy,paste,pastetext,pasteword",
			// Drop lists for link/image/media/template dialogs
			template_external_list_url : "lists/template_list.js",
			external_link_list_url : "lists/link_list.js",
			external_image_list_url : "lists/image_list.js",
			media_external_list_url : "lists/media_list.js",
			relative_urls : false,
       		remove_script_host : false,


			// Replace values for the template plugin
			template_replace_values : {
				username : "Some User",
				staffid : "991234"
			}
		});
	});
	

</script>
<!-- /TinyMCE -->  
