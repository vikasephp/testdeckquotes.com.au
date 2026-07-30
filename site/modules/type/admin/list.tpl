<!--<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/w3.css" />-->

<script>
	!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<script type="text/javascript" >  
		$(document).ready(function() {
			/*
			*   Examples - images
			*/
			$(".various").fancybox({
				'width': '75%',
				'height': '75%',
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
		
		});

</script>

<script type="text/javascript">

function close_win()
	{
	$.fancybox.close();
	window.location.reload();
	}
	
</script>	

<div class="newdiv">
<h3 class="page-title">{{$title}}</h3>
<table id="list-table" width="100%" >
     <tr>
     	        <th class="topmenu" align="center" valign="middle" width="2%"> No.</th>
                <th class="topmenu" align="center" valign="middle"> Name</th>
                <th class="topmenu" align="center" valign="middle" width="20%">Action</th>
    </tr>
    {{foreach from=$list key="key" item="item"}}
  
    <tr>
    	<td class="text2" align="left">{{counter}}</td>
        <td class="text2" align="left">{{$item.tm_type}}</td>
        <td align="left">
        <a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" title="View">Rename</a>&nbsp;|
        <a href="{{$BASE_URL}}typeAdmin.view_options/{{$ID}}/{{$item.$ID}}" class="various" title="View">Edit</a>&nbsp;|
        <a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}" title="Delete" onclick="javascript:if(!confirm('Are you sure you want to delete?')) return false;">Delete</a>
	</td>
    </tr>
   
    {{/foreach}}
</table>
</div>
