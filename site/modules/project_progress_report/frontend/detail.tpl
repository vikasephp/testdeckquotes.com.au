<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
 
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />


{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);

</script>
{{/if}}

<style>

.slidecontainer {
  width: 225px;
}

.slider {
  -webkit-appearance: none;
  width: 100%;
  height: 5px;
  background: #06F ;
  outline: none;
  opacity: 0.7;
  -webkit-transition: .2s;
  transition: opacity .2s;
}

.slider:hover {
  opacity: 1;
}

.slider::-webkit-slider-thumb {
  -webkit-appearance: none;
  appearance: none;
  width: 5px;
  height: 25px;
  background: #F00 ;
  cursor: pointer;
}

.slider::-moz-range-thumb {
  width: 15px;
  height: 15px;
  background: #F00;
  cursor: pointer;
}
</style>


<div align="center">
<h3 class="page-title">Add Project In Project Progress Report</h3><br /><br />
   <form name="detail" method="post" action="{{$XFA.detail}}" enctype="multipart/form-data">							
   
   {{if !$opr}}
   {{if $msg }} <div style="font-weight:bold; font-size:15px; color:#F00;"> {{$msg }}</div> {{/if}}
 
 <input type="hidden" name="{{$TABLE}}[pp_id]" value="{{$detail.pp_id}}" id="dh_id"/>
 
     <table id="list-table" width="100%" cellpadding="0" cellspacing="0">
     
        <tr>
            <th>Project Address:</th>
            <td> 
            
          <datalist id='project'>
           {{foreach from=$projdetail key="key3" item="item3"}}
            <option value="{{$item3.bsn_name}}" {{if $bsnid eq $item3.bsn_id}} selected="selected" {{/if}}>
            {{$item3.bsn_name}}
            </option>
            {{/foreach}}
  	      </datalist>
         <input type="text" list = 'project' name="{{$TABLE}}[pp_project]" style ="width:700px" value="{{$detail.pp_project}}" required="required" />
            
            </td>
        </tr>
        
        <tr>
            <th>Event Name</th>
            <td> <input type="text" name="{{$TABLE}}[pp_event_name]" value="{{$detail.pp_event_name}}" style="width:200px;"/></td>
        </tr>
 
        <!-- <tr>
            <th>Assigned Supplier</th>
            <td>{{$item.car_include_supplier}} <br /><br />
        <a href ="{{$BASE_URL}}construction_alert_report.include_suppliers/car_id/{{$item.car_id}}" class="various">Include Supplier</a><br /><br /></td>
        </tr>
        -->
         <tr>
            <th>Percentage of Completion</th>
            <td>
            <div class="slidecontainer">
              <input type="range" name="{{$TABLE}}[pp_perc_comp]" min="0" max="100" value="{{$detail.pp_perc_comp}}" class="slider" id="myRange"  >
               <p>%: <span id="demo"></span></p>
              </div>
               
			   <script>
                var slider = document.getElementById("myRange");
                var output = document.getElementById("demo");
                output.innerHTML = slider.value;
                
                slider.oninput = function() {
                  output.innerHTML = this.value;
                }
                </script>    
            
             </td>
        </tr>
       
        
<!--        <tr>
        <th>PO Sent Date</th>
        <td>
        <input type="text" name="purchse_order[po_sent_date]" value="{{$detail.po_sent_date}}" class="w16em dateformat-d-ds-m-ds-Y" id="demo7" maxlength="25" />
        </td>
       </tr>-->
        

        
<!--         <tr>
        <th>Approval</th>
        <td>
        
         <select name="purchse_order[po_approval]">
             {{foreach from=$asdetail key="key" item="item"}}
             <option value="{{$item.to_option}}" {{if $detail.po_approval eq $item.to_option }} selected="selected" {{/if}}>{{$item.to_option}}</option>
             {{/foreach}}
        </select>
        
           </td>
       </tr>-->
        
        <tr>
                <td colspan="2" style="text-align:center;">
                    <input type="submit" name="subAddDetail" value="Save" class="vsml" />
                    <input type="button" name="btnCancelDetail" value="Cancel" onclick="javascript:parent.$.fancybox.close();" class="vsml" />
                </td>
        </tr>
           
            
		</table>
     
       
     {{else}}
     	<div style="font-size:24px; height:99px; padding-top:150px;">{{$opr}}</div> 
{{/if}}
</div>
   </form>



<script>
	initSample();
</script>