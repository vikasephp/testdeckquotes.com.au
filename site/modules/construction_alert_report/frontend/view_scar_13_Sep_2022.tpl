<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/w3.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<script>
	!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />

<style>
input {
    width: 68px;
    overflow:hidden;
}
</style>


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
    <h3 class="page-title"><br />Supplier Construction Alert Report</h3>    
   
   
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<div style="float:right; margin-right:20px;">
<input type="submit" name="er" value="Check All" />
</div>
<table id="list-table" width="99%">
<tr> 

<th width="20%">Supplier </th>
<th width="15%">Contact Name</th>
<th width="10%">Contact Email</th>
<th width="10%">Number of Open Alerts</th>
<th width="10%">View All Open Alert</th>
<th width="8%">Email Report</th> 
</tr>
       
{{foreach from=$setdata key="key" item="item"}}
<tr>

<td>{{$item.sa_supplier}}</td>
<td>{{$item.contactname}}</td> 
<td>{{$item.sa_supplier_email}}</td>
  
<td>{{$item.tot_alert}}</td>
<td><a href="{{$BASE_URL}}construction_alert_report.view_alert/sup_email/{{$item.sa_supplier_email}}" class="various" title="View" >View</a></td>
        
<td>  
        <form name ="recmet" method="post" action="">
     	<input type="hidden" name="email_report[{{$item.cs_id}}]" value="0" />
  	<label class="switch">
        <input class="switch-input" id="m_{{$item.cs_id}}" type="checkbox"  name="email_report[{{$item.cs_id}}]"  onclick="this.form.submit();"  
       {{foreach from=$emailids key="key2" item="item2"}} {{if $item.cs_id eq $item2.er_cs_id}}  checked="checked" 
          {{/if}} {{/foreach}}  />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
        </label>
        </form>
        
</td>


</tr> 
      {{/foreach}}

</table><br /><br />

<input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
</form>
    
        <script type="text/javascript">
		function closepop()
		{
		setTimeout('parent.close_win();', 500);
		}
	</script>
    
	
</div>

<script>
	initSample();
</script>
