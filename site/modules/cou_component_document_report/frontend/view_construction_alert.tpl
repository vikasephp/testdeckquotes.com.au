<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>

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
//var viewurl = "{{$BASE_URL}}designer_tracker.detail"+ "/random/" + Math.random();	
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
    <h3 class="page-title"><br />View Alerts</h3>    
   
   
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<div style="float:left; margin-left:10px; background: #09F; color:#FFF !important; padding:6px; margin-bottom:5px;"> 
<a href="{{$BASE_URL}}construction_alert_report.home/bsn_id/{{$bsn_id}}" class="various" title="Edit" style="color:#FFF; text-decoration:none; font-size:14px;" target="_blank"> Construction Alert Report of Project</a>
</div>
<div style="float:right; margin-right:10px; background: #09F; color:#FFF !important; padding:6px; margin-bottom:5px;"> 
<a href="{{$BASE_URL}}cou_component_document_report.add_construction_alert/bsn_id/{{$bsn_id}}" class="various" title="Edit" style="color:#FFF; text-decoration:none; font-size:14px;"> Add New Alert</a>
</div>


<table id="list-table" width="99%">
<tr> 
<th width="5%">RecNo</th>
<th width="70%">Alert</th><th width="15%">Photos </th><th width="10%">Status</th>

       {{foreach from=$data key="key" item="item"}}
       <tr>
      	 
        <td><a href="{{$BASE_URL}}construction_alert_report.home/car_id/{{$item.car_id}}" target="_blank">{{$item.car_id}}</a></td> 
        <td>{{$item.car_alert}}</td>
        <td>
        {{if $item.car_image1}}
        <div style="text-align:center;"> 
        Photo 1 :  <!--<a href="{{$BASE_URL}}files/uploads/{{$item.car_image1}}" target="_blank">Download</a>-->
         <a href="/cou_component_document_report.download_content_ca?file_name={{$item.car_image1}}&module_name=cou_component_document_report.home" target="_blank"/>Download</a>
        </div>
        {{/if}}
        
        
        
        {{if $item.car_image2}}
        <div style="text-align:center;"> 
        Photo 2 : <!-- <a href="{{$BASE_URL}}files/uploads/{{$item.car_image2}}" target="_blank">Download</a>-->
         <a href="/cou_component_document_report.download_content_ca?file_name={{$item.car_image2}}&module_name=cou_component_document_report.home" target="_blank"/>Download</a>
        </div>
        {{/if}}
        
        {{if $item.car_image3}}
        <div style="text-align:center;"> 
        Photo 3 :  <!--<a href="{{$BASE_URL}}files/uploads/{{$item.car_image3}}" target="_blank">Download</a>-->
        <a href="/cou_component_document_report.download_content_ca?file_name={{$item.car_image3}}&module_name=cou_component_document_report.home" target="_blank"/>Download</a>
        </div>
        {{/if}}
        
        {{if $item.car_image4}}
        <div style="text-align:center;"> 
        Photo 4 :  <!--<a href="{{$BASE_URL}}files/uploads/{{$item.car_image4}}" target="_blank">Download</a>-->
         <a href="/cou_component_document_report.download_content_ca?file_name={{$item.car_image4}}&module_name=cou_component_document_report.home" target="_blank"/>Download</a>
        </div>
        {{/if}}
        
        {{if $item.car_image5}}
        <div style="text-align:center;"> 
        Photo 5 :  <!--<a href="{{$BASE_URL}}files/uploads/{{$item.car_image5}}" target="_blank">Download</a>-->
          <a href="/cou_component_document_report.download_content_ca?file_name={{$item.car_image5}}&module_name=cou_component_document_report.home" target="_blank"/>Download</a>
        </div>
        {{/if}}
        
        </td>
           
        <td> {{$item.car_status}}      </td>    
       </tr> 
       
      {{/foreach}}

</table><br /><br />
<input type="button" name="btnCancelDetail" value="Close" onclick="javascript:parent.$.fancybox.close();" class="vsml" />

</form>
    
    <script type="text/javascript">
		function closepop()
		{
		setTimeout('parent.close_win();', 500);
		}
	</script>
    
	<script type="text/javascript" language="javascript" >
        var frmvalidator  = new Validator("detail");
			frmvalidator.EnableMsgsTogether();
			frmvalidator.addValidation("{{$TABLE}}[al_item]","req", "Please specify item.");
			
    </script>
</div>

<script>
	initSample();
</script>