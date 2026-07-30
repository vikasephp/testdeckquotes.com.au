<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
{{include file=$jdata}}
{{include file=$tiny_basic}}		

<script>
	!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />

<style>
	#menuTable, .clipboard_call, #searchInput, #clearSearchBtn, .blueBarBg, .footer {
		display: none;
	}
</style>


<section style="width: 100%; height: 99vh; margin: 0; padding: 0;">
	<iframe src="https://planningapprovalscanberra.com.au/api_ai_page/{{$filter_pd}}" style="width: 100%; height: 100%; margin: 0; padding: 0; border: none; box-shadow: none;"></iframe>
</section>