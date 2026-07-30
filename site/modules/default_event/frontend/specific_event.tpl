<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />

<script>
	!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />

{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<script type="application/javascript">

function add_new(url)
 {	
 var viewurl = url;
 $(document).ready(function () {
        $.fancybox({
				'width': '99%',
				'height': '99%',
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
</script>

<div align="center" style="min-height:350px; z-index:9999999;">
    <h3 class="page-title"><br />Specific Event List</h3>    
    
<form name="detail" method="post" action=""  enctype="multipart/form-data" >
<div style="float:left; margin-right:10px; background: #09F; color:#FFF !important; padding:6px; margin-bottom:5px;"> 
<input type="submit" name="add_se" value="Click to add Specific Event" />
</div>


<table id="list-table" width="99%">
<tr>
{{assign var = countn value = 1}}
       {{foreach from=$sedata key="key" item="item"}}
       <td>
<input type="checkbox" name="speve[{{$item.se_id}}]" {{foreach from=$data key="key2" item="item2"}} {{if $item2 eq $item.se_id}} checked="checked" {{/if}} {{/foreach}} />
      
       	{{$item.se_event}}</td>
       
     
       {{assign var=countn value=$countn+1}}
       {{if $countn ge 5 }}
       </tr>
       {{assign var = countn value = 1}}
       {{/if}}
       
      {{/foreach}}
</tr> 
</table><br /><br />
<input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
</form>
    
    <script type="text/javascript">
		function closepop()
		{
		setTimeout('parent.close_win();', 500);
		}
	</script>
<script>
	initSample();
</script>