<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<div align="center" style="min-height:350px;">
    <h3 class="page-title">{{$title}}</h3>    
   
   
<form name="detail" method="post" action="{{$XFA.detail}}"  enctype="multipart/form-data">
<table id="list-table" width="98%">
    <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
    <tr>
     <th>Project</th>
     <td colspan="5">
   	<datalist id='project'>
           {{foreach from=$projdetail key="key" item="item"}}
            <option value="{{$item.bsn_name}}" {{if $bsnid eq $item.bsn_id}} selected="selected" {{/if}}>
            {{$item.bsn_name}}
            </option>
            {{/foreach}}
  	 </datalist>
         <input type="text" list = 'project' name="{{$TABLE}}[dtr_project_name]" style ="width:700px" value="{{$detail.dtr_project_name}}" />
      </td>
    </tr>
   
    <tr>
     <th>Windows and Dors</th>
     <td> <input type="radio" name="{{$TABLE}}[dtr_windows_doors_opt]" value="1" {{if $detail.dtr_windows_doors_opt eq 1}} checked="checked" {{/if}} />To Be Actioned</td>
     <td> <input type="radio" name="{{$TABLE}}[dtr_windows_doors_opt]" value="2" {{if $detail.dtr_windows_doors_opt eq 2}} checked="checked" {{/if}} />Complete</td>
     <td> <input type="radio" name="{{$TABLE}}[dtr_windows_doors_opt]" value="3" {{if $detail.dtr_windows_doors_opt eq 3}} checked="checked" {{/if}}/>Require Follow Up</td>
     <td> <input type="radio" name="{{$TABLE}}[dtr_windows_doors_opt]" value="4" {{if $detail.dtr_windows_doors_opt eq 4}} checked="checked" {{/if}}/>Not Applicable</td>      
     <td> <input type="radio" name="{{$TABLE}}[dtr_windows_doors_opt]" value="5" {{if $detail.dtr_windows_doors_opt eq 5}} checked="checked" {{/if}}/>Alert</td>      

   
    </tr>
     <tr>
     <th>Wall & Roof Frames</th>
     <td> <input type="radio" name="{{$TABLE}}[dtr_wall_roof_frame_opt]" value="1" {{if $detail.dtr_wall_roof_frame_opt eq 1}} checked="checked" {{/if}} />To Be Actioned</td>
     <td> <input type="radio" name="{{$TABLE}}[dtr_wall_roof_frame_opt]" value="2" {{if $detail.dtr_wall_roof_frame_opt eq 2}} checked="checked" {{/if}} />Complete</td>
     <td> <input type="radio" name="{{$TABLE}}[dtr_wall_roof_frame_opt]" value="3" {{if $detail.dtr_wall_roof_frame_opt eq 3}} checked="checked" {{/if}}/>Require Follow Up</td>
     <td> <input type="radio" name="{{$TABLE}}[dtr_wall_roof_frame_opt]" value="4" {{if $detail.dtr_wall_roof_frame_opt eq 4}} checked="checked" {{/if}}/>Not Applicable</td>      
     <td> <input type="radio" name="{{$TABLE}}[dtr_wall_roof_frame_opt]" value="5" {{if $detail.dtr_wall_roof_frame_opt eq 5}} checked="checked" {{/if}}/>Alert</td>      

   
    </tr>
   
      <tr>
      <th>Floor System</th>
     <td> <input type="radio" name="{{$TABLE}}[dtr_floor_system_opt]" value="1" {{if $detail.dtr_floor_system_opt eq 1}} checked="checked" {{/if}} />To Be Actioned</td>
     <td> <input type="radio" name="{{$TABLE}}[dtr_floor_system_opt]" value="2" {{if $detail.dtr_floor_system_opt eq 2}} checked="checked" {{/if}} />Complete</td>
     <td> <input type="radio" name="{{$TABLE}}[dtr_floor_system_opt]" value="3" {{if $detail.dtr_floor_system_opt eq 3}} checked="checked" {{/if}}/>Require Follow Up</td>
     <td> <input type="radio" name="{{$TABLE}}[dtr_floor_system_opt]" value="4" {{if $detail.dtr_floor_system_opt eq 4}} checked="checked" {{/if}}/>Not Applicable</td>      
     <td> <input type="radio" name="{{$TABLE}}[dtr_floor_system_opt]" value="5" {{if $detail.dtr_floor_system_opt eq 5}} checked="checked" {{/if}}/>Alert</td>      

   
    </tr>

     <tr>
     <th>Bricks</th>
     <td> <input type="radio" name="{{$TABLE}}[dtr_bricks_opt]" value="1" {{if $detail.dtr_bricks_opt eq 1}} checked="checked" {{/if}} />To Be Actioned</td>
     <td> <input type="radio" name="{{$TABLE}}[dtr_bricks_opt]" value="2" {{if $detail.dtr_bricks_opt eq 2}} checked="checked" {{/if}} />Complete</td>
     <td> <input type="radio" name="{{$TABLE}}[dtr_bricks_opt]" value="3" {{if $detail.dtr_bricks_opt eq 3}} checked="checked" {{/if}}/>Require Follow Up</td>
     <td> <input type="radio" name="{{$TABLE}}[dtr_bricks_opt]" value="4" {{if $detail.dtr_bricks_opt eq 4}} checked="checked" {{/if}}/>Not Applicable</td>      
     <td> <input type="radio" name="{{$TABLE}}[dtr_bricks_opt]" value="5" {{if $detail.dtr_bricks_opt eq 5}} checked="checked" {{/if}}/>Alert</td>      

    </tr> 
  
    <tr>
     <th>Brick Accessories</th>
     <td> <input type="radio" name="{{$TABLE}}[dtr_bricks_acc_opt]" value="1" {{if $detail.dtr_bricks_acc_opt eq 1}} checked="checked" {{/if}} />To Be Actioned</td>
     <td> <input type="radio" name="{{$TABLE}}[dtr_bricks_acc_opt]" value="2" {{if $detail.dtr_bricks_acc_opt eq 2}} checked="checked" {{/if}} />Complete</td>
     <td> <input type="radio" name="{{$TABLE}}[dtr_bricks_acc_opt]" value="3" {{if $detail.dtr_bricks_acc_opt eq 3}} checked="checked" {{/if}}/>Require Follow Up</td>
     <td> <input type="radio" name="{{$TABLE}}[dtr_bricks_acc_opt]" value="4" {{if $detail.dtr_bricks_acc_opt eq 4}} checked="checked" {{/if}}/>Not Applicable</td>      
     <td> <input type="radio" name="{{$TABLE}}[dtr_bricks_acc_opt]" value="5" {{if $detail.dtr_bricks_acc_opt eq 5}} checked="checked" {{/if}}/>Alert</td>      

    </tr> 
  
   <tr>
     <th>Close Up</th>
     <td> <input type="radio" name="{{$TABLE}}[dtr_close_up_opt]" value="1" {{if $detail.dtr_close_up_opt eq 1}} checked="checked" {{/if}} />To Be Actioned</td>
     <td> <input type="radio" name="{{$TABLE}}[dtr_close_up_opt]" value="2" {{if $detail.dtr_close_up_opt eq 2}} checked="checked" {{/if}} />Complete</td>
     <td> <input type="radio" name="{{$TABLE}}[dtr_close_up_opt]" value="3" {{if $detail.dtr_close_up_opt eq 3}} checked="checked" {{/if}}/>Require Follow Up</td>
     <td> <input type="radio" name="{{$TABLE}}[dtr_close_up_opt]" value="4" {{if $detail.dtr_close_up_opt eq 4}} checked="checked" {{/if}}/>Not Applicable</td>      
     <td> <input type="radio" name="{{$TABLE}}[dtr_close_up_opt]" value="5" {{if $detail.dtr_close_up_opt eq 5}} checked="checked" {{/if}}/>Alert</td>      
    </tr> 

    <tr>
     <th>Project Inclusions</th>
     <td> <input type="radio" name="{{$TABLE}}[dtr_proj_incl_opt]" value="1" {{if $detail.dtr_proj_incl_opt eq 1}} checked="checked" {{/if}} />To Be Actioned</td>
     <td> <input type="radio" name="{{$TABLE}}[dtr_proj_incl_opt]" value="2" {{if $detail.dtr_proj_incl_opt eq 2}} checked="checked" {{/if}} />Complete</td>
     <td> <input type="radio" name="{{$TABLE}}[dtr_proj_incl_opt]" value="3" {{if $detail.dtr_proj_incl_opt eq 3}} checked="checked" {{/if}}/>Require Follow Up</td>
     <td> <input type="radio" name="{{$TABLE}}[dtr_proj_incl_opt]" value="4" {{if $detail.dtr_proj_incl_opt eq 4}} checked="checked" {{/if}}/>Not Applicable</td>      
     <td> <input type="radio" name="{{$TABLE}}[dtr_proj_incl_opt]" value="5" {{if $detail.dtr_proj_incl_opt eq 5}} checked="checked" {{/if}}/>Alert</td>      

    </tr> 

   <tr>
     <th>Project Addition</th>
     <td> <input type="radio" name="{{$TABLE}}[dtr_proj_add_opt]" value="1" {{if $detail.dtr_proj_add_opt eq 1}} checked="checked" {{/if}} />To Be Actioned</td>
     <td> <input type="radio" name="{{$TABLE}}[dtr_proj_add_opt]" value="2" {{if $detail.dtr_proj_add_opt eq 2}} checked="checked" {{/if}} />Complete</td>
     <td> <input type="radio" name="{{$TABLE}}[dtr_proj_add_opt]" value="3" {{if $detail.dtr_proj_add_opt eq 3}} checked="checked" {{/if}}/>Require Follow Up</td>
     <td> <input type="radio" name="{{$TABLE}}[dtr_proj_add_opt]" value="4" {{if $detail.dtr_proj_add_opt eq 4}} checked="checked" {{/if}}/>Not Applicable</td>      
     <td> <input type="radio" name="{{$TABLE}}[dtr_proj_add_opt]" value="5" {{if $detail.dtr_proj_add_opt eq 5}} checked="checked" {{/if}}/>Alert</td>      

    </tr> 

 <tr>
     <th>Garage Door</th>
     <td> <input type="radio" name="{{$TABLE}}[dtr_garage_door_opt]" value="1" {{if $detail.dtr_garage_door_opt eq 1}} checked="checked" {{/if}} />To Be Actioned</td>
     <td> <input type="radio" name="{{$TABLE}}[dtr_garage_door_opt]" value="2" {{if $detail.dtr_garage_door_opt eq 2}} checked="checked" {{/if}} />Complete</td>
     <td> <input type="radio" name="{{$TABLE}}[dtr_garage_door_opt]" value="3" {{if $detail.dtr_garage_door_opt eq 3}} checked="checked" {{/if}}/>Require Follow Up</td>
     <td> <input type="radio" name="{{$TABLE}}[dtr_garage_door_opt]" value="4" {{if $detail.dtr_garage_door_opt eq 4}} checked="checked" {{/if}}/>Not Applicable</td>      
     <td> <input type="radio" name="{{$TABLE}}[dtr_garage_door_opt]" value="5" {{if $detail.dtr_garage_door_opt eq 5}} checked="checked" {{/if}}/>Alert</td>      

   
    </tr> 

 <tr>
     <th>Interior Fit Out</th>
     <td> <input type="radio" name="{{$TABLE}}[dtr_interior_fit_opt]" value="1" {{if $detail.dtr_interior_fit_opt eq 1}} checked="checked" {{/if}} />To Be Actioned</td>
     <td> <input type="radio" name="{{$TABLE}}[dtr_interior_fit_opt]" value="2" {{if $detail.dtr_interior_fit_opt eq 2}} checked="checked" {{/if}} />Complete</td>
     <td> <input type="radio" name="{{$TABLE}}[dtr_interior_fit_opt]" value="3" {{if $detail.dtr_interior_fit_opt eq 3}} checked="checked" {{/if}}/>Require Follow Up</td>
     <td> <input type="radio" name="{{$TABLE}}[dtr_interior_fit_opt]" value="4" {{if $detail.dtr_interior_fit_opt eq 4}} checked="checked" {{/if}}/>Not Applicable</td>      
     <td> <input type="radio" name="{{$TABLE}}[dtr_interior_fit_opt]" value="5" {{if $detail.dtr_interior_fit_opt eq 5}} checked="checked" {{/if}}/>Alert</td>      

   
    </tr> 

   <tr>
     <th>Wall and Floor Tiles</th>
     <td> <input type="radio" name="{{$TABLE}}[dtr_wall_floor_tile_opt]" value="1" {{if $detail.dtr_wall_floor_tile_opt eq 1}} checked="checked" {{/if}} />To Be Actioned</td>
     <td> <input type="radio" name="{{$TABLE}}[dtr_wall_floor_tile_opt]" value="2" {{if $detail.dtr_wall_floor_tile_opt eq 2}} checked="checked" {{/if}} />Complete</td>
     <td> <input type="radio" name="{{$TABLE}}[dtr_wall_floor_tile_opt]" value="3" {{if $detail.dtr_wall_floor_tile_opt eq 3}} checked="checked" {{/if}}/>Require Follow Up</td>
     <td> <input type="radio" name="{{$TABLE}}[dtr_wall_floor_tile_opt]" value="4" {{if $detail.dtr_wall_floor_tile_opt eq 4}} checked="checked" {{/if}}/>Not Applicable</td>      
     <td> <input type="radio" name="{{$TABLE}}[dtr_wall_floor_tile_opt]" value="5" {{if $detail.dtr_wall_floor_tile_opt eq 5}} checked="checked" {{/if}}/>Alert</td>      

   
    </tr> 

   <tr>
     <th>Water Tank</th>
     <td> <input type="radio" name="{{$TABLE}}[dtr_water_tank_opt]" value="1" {{if $detail.dtr_water_tank_opt eq 1}} checked="checked" {{/if}} />To Be Actioned</td>
     <td> <input type="radio" name="{{$TABLE}}[dtr_water_tank_opt]" value="2" {{if $detail.dtr_water_tank_opt eq 2}} checked="checked" {{/if}} />Complete</td>
     <td> <input type="radio" name="{{$TABLE}}[dtr_water_tank_opt]" value="3" {{if $detail.dtr_water_tank_opt eq 3}} checked="checked" {{/if}}/>Require Follow Up</td>
     <td> <input type="radio" name="{{$TABLE}}[dtr_water_tank_opt]" value="4" {{if $detail.dtr_water_tank_opt eq 4}} checked="checked" {{/if}}/>Not Applicable</td>      
     <td> <input type="radio" name="{{$TABLE}}[dtr_water_tank_opt]" value="5" {{if $detail.dtr_water_tank_opt eq 5}} checked="checked" {{/if}}/>Alert</td>      

    
    </tr> 

   <tr>
     <th>Window Coverings</th>
     <td> <input type="radio" name="{{$TABLE}}[dtr_window_cov_opt]" value="1" {{if $detail.dtr_window_cov_opt eq 1}} checked="checked" {{/if}} />To Be Actioned</td>
     <td> <input type="radio" name="{{$TABLE}}[dtr_window_cov_opt]" value="2" {{if $detail.dtr_window_cov_opt eq 2}} checked="checked" {{/if}} />Complete</td>
     <td> <input type="radio" name="{{$TABLE}}[dtr_window_cov_opt]" value="3" {{if $detail.dtr_window_cov_opt eq 3}} checked="checked" {{/if}}/>Require Follow Up</td>
     <td> <input type="radio" name="{{$TABLE}}[dtr_window_cov_opt]" value="4" {{if $detail.dtr_window_cov_opt eq 4}} checked="checked" {{/if}}/>Not Applicable</td>      
     <td> <input type="radio" name="{{$TABLE}}[dtr_window_cov_opt]" value="5" {{if $detail.dtr_window_cov_opt eq 5}} checked="checked" {{/if}}/>Alert</td>      

   
    </tr> 

    <tr>
     <th>Floor Coverings</th>
     <td> <input type="radio" name="{{$TABLE}}[dtr_floor_cov_opt]" value="1" {{if $detail.dtr_floor_cov_opt eq 1}} checked="checked" {{/if}} />To Be Actioned</td>
     <td> <input type="radio" name="{{$TABLE}}[dtr_floor_cov_opt]" value="2" {{if $detail.dtr_floor_cov_opt eq 2}} checked="checked" {{/if}} />Complete</td>
     <td> <input type="radio" name="{{$TABLE}}[dtr_floor_cov_opt]" value="3" {{if $detail.dtr_floor_cov_opt eq 3}} checked="checked" {{/if}}/>Require Follow Up</td>
     <td> <input type="radio" name="{{$TABLE}}[dtr_floor_cov_opt]" value="4" {{if $detail.dtr_floor_cov_opt eq 4}} checked="checked" {{/if}}/>Not Applicable</td>      
     <td> <input type="radio" name="{{$TABLE}}[dtr_floor_cov_opt]" value="5" {{if $detail.dtr_floor_cov_opt eq 5}} checked="checked" {{/if}}/>Alert</td>      

   
    </tr> 


     
     <tr>
        <td colspan="5" style="text-align:center;">
          <input type="submit" name="subAddDetail" value="Save" class="vsml" />
          <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
        </td>
    </tr>
</table>
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
			frmvalidator.addValidation("{{$TABLE}}[wa_project]","req", "Please specify project.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_company_name]","req", "Please specify company name.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_contact_name]","req", "Please specify contact name.");
    </script>
</div>
