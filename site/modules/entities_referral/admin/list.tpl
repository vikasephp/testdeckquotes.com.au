<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

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
				'width': '98%',
				'height': '98%',
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

<script>

function close_win()
	{
	$.fancybox.close();
	window.location.reload();
	}

 function submit_form()
 {
 	document.send_form.submit();
 }
 
</script>

<h3 class="page-title">{{$title}}</h3>
<div id="">
    <div align="left">
    <div style="font-weight:bold; color:#FF6600;">{{$msg}}</div>
    </div>

    <table id="list-table" class="nav-back" width="100%">

       <thead>
            <tr>
              <th class="topmenu" align="center" valign="middle" width="8%">Order</th>  
              <th class="topmenu" align="center" valign="middle" width="40%">Document/Plan</th>
              <th class="topmenu" align="center" valign="middle" width="40%">Link (DC UID)</th>   
              <th class="topmenu" align="center" valign="middle" width="12%">Action</th>   
          </tr>
        </thead>

        <tbody>

        {{foreach from=$doc item="item" key="key"}}

            <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
             <td>{{$item.er_order}}</td>
             <td>{{$item.er_document}}</td>
             <td>{{$item.er_dc_uid}}</td>
             <td>
                <a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.er_id}}"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;<a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.er_id}}" onclick="javascript:if(!confirm('Are you sure you want to delete the doc?')) return false;"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>
              </td>
            </tr>
        {{/foreach}}
        
        </tbody>
    </table>
</div>