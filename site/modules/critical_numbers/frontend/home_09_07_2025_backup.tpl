{{include file=$jdata}}
{{include file=$tiny_basic}}		
<h3 class="page-title">{{$title}}</h3>


<script>
 function add_procedure()
{
	var viewurl = "{{$BASE_URL}}critical_numbers.view_procedure"+ "/random/" + Math.random();	

 	$(document).ready(function () {

        $.fancybox({

				'width': '90%',
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

<style>
#fancybox-wrap {z-index:9999999;} 
</style>

<form name="cn" method="post" action="">
<div style="float:left; text-align:left;">
 &nbsp;&nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> 
<br />
</div>
<input type="submit" name="savecn" value="Save/Update Data" />
<div>
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
                   <th class="topmenu" align="center" valign="middle" width="5%">Sr. No.</th>  
                   <th class="topmenu" align="center" valign="middle" width="25%">Key Performance Indicator </th>   
            	   <th class="topmenu" align="center" valign="middle" width="15%">Measurement</th>
		   <th class="topmenu" align="center" valign="middle" width="30%">Link</th>
            </tr>
        </thead>
    <tbody>

{{foreach from=$list key="key" item="item"}}

    <tr bgcolor="#FFFFFF">
        <td>{{$item.cn_id}}</td>
        <td>{{$item.cn_kpi}} </td> 
        <td style="text-align:center;" >
        {{if $item.cn_id eq 1 }}
       		 <input name ='measurment[{{$item.cn_id}}]' type="text" value="{{$item.cn_measurment}}"/>
        {{elseif $item.cn_id eq 2}}
        	{{$7dayleads}}
        
        {{elseif $item.cn_id eq 3}}
        	{{$year}}
                
        {{elseif $item.cn_id eq 4}}
        	{{$planning7}}
        
        {{elseif $item.cn_id eq 5}}
        	{{$planningyear}}
        
        {{elseif $item.cn_id eq 6 }}
       		 <input name ='measurment[{{$item.cn_id}}]' type="text" value="{{$item.cn_measurment}}" />
        
        {{elseif $item.cn_id eq 7}}
        	{{$hia}}
                
        {{elseif $item.cn_id eq 8}}
       		 <input name ='measurment[{{$item.cn_id}}]' type="text" value="{{$item.cn_measurment}}" />
        
         {{elseif $item.cn_id eq 9}}
       		 <input name ='measurment[{{$item.cn_id}}]' type="text" value="{{$item.cn_measurment}}" />
        
         {{elseif $item.cn_id eq 10}}
       		 <input name ='measurment[{{$item.cn_id}}]' type="text" value="{{$item.cn_measurment}}" />         
        
        {{elseif $item.cn_id eq 13}}
        	{{$design_tot}}
        
        {{elseif $item.cn_id eq 14}}
       		 <input name ='measurment[{{$item.cn_id}}]' type="text" value="{{$item.cn_measurment}}" />  
        
         {{elseif $item.cn_id eq 15}}
        	{{$planning1}}
        
         {{elseif $item.cn_id eq 16}}
        	{{$avg_days_pl}} 
                
         {{elseif $item.cn_id eq 17}}
        	{{$inclusion_tot}}  
        
         {{elseif $item.cn_id eq 18}}
        	{{$inc_avg_days}}             
       
        {{elseif $item.cn_id eq 19}}
        	{{$construction_tot}}   
       
        {{elseif $item.cn_id eq 20}}
        	{{$const_avg_days}}  
                
         {{elseif $item.cn_id eq 21}}
        	{{$warranty_open}}         
                                          
        {{/if}}
        </td>
        <td></td>
    </tr>
  {{/foreach}}  
 
  </tbody>
  </table>
  </div> 
   </form>