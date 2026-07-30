<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

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
    <h3 class="page-title"><br />Flooting Inspections - Certifier Completion</h3>    

<div style="float:left; margin-bottom:10px; font-size:14px;">
<strong>Project Address : {{$proj_name}}</strong>
</div>
  
<form name="detail" method="post" action=""  enctype="multipart/form-data">

<table id="list-table" width="99%">
	<thead>
			<tr>
				<th class="topmenu" align="center" valign="middle" width="25%">Alert</th>
				<th class="topmenu" align="center" valign="middle" width="15%">Supplier Responsible</th>
				<th class="topmenu" align="center" valign="middle" width="9%">Status</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Photos</th>
				<th class="topmenu" align="center" valign="middle" width="9%">Link</th>			
			</tr>
		</thead>

   {{foreach from=$carData key="key" item="item"}}
   		<tr>
           <td>{{$item.car_alert}} </td>
           
            <td>
             {{foreach from=$item.supplier key="key2" item="item2"}}
             	{{$item2.se_first_name}} {{$item2.se_surname}}<br />
             {{/foreach}}
            
            </td> 
            
            
           <td>{{$item.car_status}} </td>
          <td>
					{{if $item.car_image1}}
						<div style="text-align:center;">
							{{ if $item.car_image1_newdesign }}
								Photo 1 : <a href="/certifier_structural_engineer.download_content?file_name={{$item.car_image1}}&module_name={{ $BASEFOLDER }}.home" target="_blank"><img data-src="/{{ $BASEFOLDER }}.download_content?file_name={{$item.car_image1}}&module_name={{ $BASEFOLDER }}.home" class="lazy">Download</a>
							{{ else }}
								Photo 1 : <a href="{{$BASE_URL}}files/uploads/{{$item.car_image1}}" target="_blank"><img data-src="{{$BASE_URL}}files/uploads/{{$item.car_image1}}" class="lazy">Download</a>
							{{ /if }}
						</div>
					{{/if}}
					{{if $item.car_image2}}
						<div style="text-align:center;">
							{{ if $item.car_image2_newdesign }}
								Photo 2 : <a href="/certifier_structural_engineer.download_content?file_name={{$item.car_image2}}&module_name={{ $BASEFOLDER }}.home" target="_blank"><img data-src="/{{ $BASEFOLDER }}.download_content?file_name={{$item.car_image2}}&module_name={{ $BASEFOLDER }}.home" class="lazy">Download</a>
							{{ else }}
								Photo 2 : <a href="{{$BASE_URL}}files/uploads/{{$item.car_image2}}" target="_blank"><img data-src="{{$BASE_URL}}files/uploads/{{$item.car_image2}}" class="lazy">Download</a>
							{{ /if }}
						</div>
					{{/if}}
					{{if $item.car_image3}}
						<div style="text-align:center;">
							{{ if $item.car_image3_newdesign }}
								Photo 3 : <a href="/certifier_structural_engineer.download_content?file_name={{$item.car_image3}}&module_name={{ $BASEFOLDER }}.home" target="_blank"><img data-src="/{{ $BASEFOLDER }}.download_content?file_name={{$item.car_image3}}&module_name={{ $BASEFOLDER }}.home" class="lazy">Download</a>
							{{ else }}
								Photo 3 : <a href="{{$BASE_URL}}files/uploads/{{$item.car_image3}}" target="_blank"><img data-src="{{$BASE_URL}}files/uploads/{{$item.car_image3}}" class="lazy">Download</a>
							{{ /if }}
						</div>
					{{/if}}
					{{if $item.car_image4}}
						<div style="text-align:center;">
							{{ if $item.car_image4_newdesign }}
								Photo 4 : <a href="/certifier_structural_engineer.download_content?file_name={{$item.car_image4}}&module_name={{ $BASEFOLDER }}.home" target="_blank"><img data-src="/{{ $BASEFOLDER }}.download_content?file_name={{$item.car_image4}}&module_name={{ $BASEFOLDER }}.home" class="lazy">Download</a>
							{{ else }}
								Photo 4 : <a href="{{$BASE_URL}}files/uploads/{{$item.car_image4}}" target="_blank"><img data-src="{{$BASE_URL}}files/uploads/{{$item.car_image4}}" class="lazy">Download</a>
							{{ /if }}
						</div>
					{{/if}}
					{{if $item.car_image5}}
						<div style="text-align:center;">
							{{ if $item.car_image5_newdesign }}
								Photo 5 : <a href="/certifier_structural_engineer.download_content?file_name={{$item.car_image5}}&module_name={{ $BASEFOLDER }}.home" target="_blank"><img data-src="/{{ $BASEFOLDER }}.download_content?file_name={{$item.car_image5}}&module_name={{ $BASEFOLDER }}.home" class="lazy">Download</a>
							{{ else }}
								Photo 5 : <a href="{{$BASE_URL}}files/uploads/{{$item.car_image5}}" target="_blank"><img data-src="{{$BASE_URL}}files/uploads/{{$item.car_image5}}" class="lazy">Download</a>
							{{ /if }}
						</div>
					{{/if}}
				</td>
        
          
           <td> <a href = "{{$BASE_URL}}construction_alert_report.home/car_id/{{$item.car_id}}" target="_blank">{{$item.car_id}}</a></td>   
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
    
	<script type="text/javascript" language="javascript" >
        	var frmvalidator  = new Validator("detail");
			frmvalidator.EnableMsgsTogether();
			frmvalidator.addValidation("{{$TABLE}}[al_item]","req", "Please specify item.");
			
    </script>
</div>

<script>
	initSample();
</script>