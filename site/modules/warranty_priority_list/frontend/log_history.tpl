
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/w3.css" />

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />

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
<div style="font-size:18; text-align:center"><strong>{{$wa_project}}</strong></div><br />
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
                   <th class="topmenu" align="center" valign="middle" width="3%">Rec. No.</th>  
                   <th class="topmenu" align="center" valign="middle" width="10%">Contact Info</th>
                   <th class="topmenu" align="center" valign="middle" width="5%">Walkthrough Date</th>  
                   <!--<th class="topmenu" align="center" valign="middle" width="5%">Priority</th> --> 
                   <th class="topmenu" align="center" valign="middle" width="5%">Type</th> 
                   <th class="topmenu" align="center" valign="middle" width="5%">Tenanted</th>
            	   <th class="topmenu" align="center" valign="middle" width="5%">Date</th>
                   <th class="topmenu" align="center" valign="middle" width="5%">Days Count</th>
                   <th class="topmenu" align="center" valign="middle" width="20%">Problem</th> 
                   <th class="topmenu" align="center" valign="middle" width="9%">Problem Photo</th>
                   <th class="topmenu" align="center" valign="middle" width="9%">Video Files</th>  
                  <!-- <th class="topmenu" align="center" valign="middle" width="23%">Notes</th> -->

                   <th class="topmenu" align="center" valign="middle" width="8%">Responsible Position</th> 
          		<!--   <th class="topmenu" align="center" valign="middle" width="4%">Customer Enquiry</th> -->
                   <th class="topmenu" align="center" valign="middle" width="4%">Status</th> 
                  
                   
                    
            </tr>
        </thead>
    <tbody>

 {{foreach from=$list key="key" item="item"}}

    <tr {{if $item.wa_status eq 'Pending'}} bgcolor="#f7b900" {{else}} bgcolor="#FFFFFF" {{/if}}>

        <td>{{$item.wa_id}}</td>
        
        <td>{{$item.bcust_fname}}&nbsp;{{$item.bcust_lname}}<br />{{$item.bcust_misc_moble}}</td>
        <td>{{$item.wa_walkthrough_date}}</td> 
       <!-- <td> {{$item.wa_priority}}-->
         
        
        
        </td>
        <td> {{$item.wa_type}}</td>
         
    
        <td>{{$item.wa_tenanted}}</td>
       
        <td>{{$item.wa_date}}<br />{{$item.wa_user}}</td>
        <td>{{$item.dayscount}}</td>
        <td>{{$item.wa_problem|stripslashes}}</td>
        <td>
        {{if $item.wa_image_1}}
        <div style="text-align:center;"> 
     
        Photo 1 :  <a href="/warranty_log.download_content?file_name={{$item.wa_image_1}}&module_name=warranty_log.home
" target="_blank">Download</a>
        
        </div>
        {{/if}}
        
        {{if $item.wa_image_2}}
        <div style="text-align:center;"> 

        Photo 2 :  <a href="/warranty_log.download_content?file_name={{$item.wa_image_2}}&module_name=warranty_log.home
" target="_blank">Download</a>
        
        
        </div>
        {{/if}}
        
        {{if $item.wa_image_3}}
        <div style="text-align:center;"> 
    
        Photo 3 :  <a href="/warranty_log.download_content?file_name={{$item.wa_image_3}}&module_name=warranty_log.home
" target="_blank">Download</a>
        
        </div>
        {{/if}}
        
        {{if $item.wa_image_4}}
        <div style="text-align:center;"> 

        Photo 4 :  <a href="/warranty_log.download_content?file_name={{$item.wa_image_4}}&module_name=warranty_log.home
" target="_blank">Download</a>
        
        </div>
        {{/if}}
        
        {{if $item.wa_image_5}}
        <div style="text-align:center;"> 
       
        Photo 5 :  <a href="/warranty_log.download_content?file_name={{$item.wa_image_5}}&module_name=warranty_log.home
" target="_blank">Download</a>
        </div>
        {{/if}}
        
         </td>
         
         <td> 
          {{if $item.wa_video}}
       
            <a href="/warranty_log.download_content?file_name={{$item.wa_video}}&module_name=warranty_log.home
" target="_blank">Download</a>
          {{/if}}
         </td>
         
 <!--        <td> 
         <a href="{{$BASE_URL}}warranty_log.view_notes/wa_id/{{$item.wa_id}}" class="various">Notes</a>
         {{$item.notes_date}}
         </td>-->

        <td> 
        
        {{$item.wa_resp_staff}}
        
         
        </td>
        
  
     <!--  
       <td {{if $item.enquiry_pen eq 1 }} style="background: #FF0 ;" {{/if}}>
       <a href ="{{$BASE_URL}}warranty_log.view_enquiry/wa_id/{{$item.wa_id}}" class="various">Enquiry</a>
       </td>-->
       
       
        <td> 
        {{if $item.wa_status eq 'Pending'}}
       		 <a href="{{$BASE_URL}}warranty_log.status_approve/wa_id/{{$item.wa_id}}" class="various">{{$item.wa_status}}
        {{else}}
        	{{$item.wa_status}}
        	{{if $item.wa_status eq 'Closed'}}<br />{{$item.wa_status_date}} {{/if}}
        {{/if}}
        
        </td>
 

    </tr>  
  {{/foreach}}
  </tbody>
  </table>
    
<input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
</form>
    
        <script type="text/javascript">
		function closepop()
		{
		setTimeout('parent.close_win();', 500);
		//window.location.href = "{{$BASE_URL}}construction_alert_report.view_scar/sup_email/{{$sup_email}}";
		}
	</script>	
</div>

<script>
	initSample();
</script>
