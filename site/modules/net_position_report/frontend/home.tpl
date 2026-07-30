<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
{{include file=$jdata}}
{{include file=$tiny_basic}}		
<h3 class="page-title">{{$title}}</h3>
<br />
<style>
.set { font-size:10px !important; 
       width:25px !important; display:inline-block; 
       padding-top:1px !important;
       padding-bottom: 1px !important;
       padding-left:1px !important;
       height:25px !important; }
	   
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
       
#fancybox-wrap {z-index:9999999;} 
</style>

<script language="javascript">

function add_procedure()
{
	var viewurl = "{{$BASE_URL}}net_position_report.view_procedure"+ "/random/" + Math.random();	

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

<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
    <div style="float:left; text-align:left;">
    &nbsp; &nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> <br />
    </div>
 </form>


 <table id="list-table" class="nav-back" width="100%" >
        <thead>
            <tr>
                <th class="topmenu" align="center" valign="middle" width="15%">What</th>   
                <th class="topmenu" align="center" valign="middle" width="10%">Type</th> 
                <th class="topmenu" align="center" valign="middle" width="15%">Method</th>
                <th class="topmenu" align="center" valign="middle" width="15%">Value Asset</th>
                <th class="topmenu" align="center" valign="middle" width="15%">Value Liability</th>
                <th class="topmenu" align="center" valign="middle" width="15%">Accuracy</th>
                <th class="topmenu" align="center" valign="middle" width="15%">QAD</th>
            </tr>
        </thead>
 <tbody>
 {{assign var=countn value= $total}}
 {{foreach from=$npData key="key" item="item"}}
 <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">

    <td>{{$item.np_what}}</td>
    <td>{{$item.np_type}}</td> 
    <!--<td>${{$totbalance|number_format:2:".":","}}</td>-->
	<td data-check="{{$item.np_what}}">
	{{if $item.np_what eq 'Deposit Report'}}
	<a href="{{$BASE_URL}}deposite_report.home">{{$item.np_method}}</a>
	{{elseif $item.np_what eq '30 Day Receivables'}}
	<a href="{{$BASE_URL}}30_days_rec_report.home">{{$item.np_method}}</a>
	{{elseif $item.np_what eq 'Work In Progress'}}
	<a href="{{$BASE_URL}}work_in_progress_report.home">{{$item.np_method}}</a>
	{{elseif $item.np_what eq 'NAFP'}}
	<a href="{{$BASE_URL}}poincc2.home">{{$item.np_method}}</a>
	{{elseif $item.np_what eq 'Design Profit'}}
	<a href="{{$BASE_URL}}design_report.design_conversion">{{$item.np_method}}</a>
	{{else}}
		{{$item.np_method}}
	{{/if}}
	</td>
    <td>
    {{if $item.np_type eq 'Asset'}}
      {{if $item.np_method eq 'Link'}}
        {{if $item.np_what eq 'Deposit Report'}}
           $ {{$item.totbalance}}
        
        
        {{elseif $item.np_what eq '30 Day Receivables'}}
         ${{$total}}
       
        {{elseif $item.np_what eq 'Work In Progress'}}
         ${{$tot_wip_cog}}
         
        {{elseif $item.np_what eq 'Design Profit'}}
         ${{$dpdata.dp_profit|number_format:2:".":","}} 
        {{/if}}
        
        
           
       {{else}}
    
            <input type="text" name="val_asset" value="{{$item.np_asset}}" onkeyup="update_value_asset({{$item.np_id}},this.value)" />
            <script>
                function update_value_asset(id,value)
                {
                     $.ajax({
                           type: "GET",
                           url: "{{$BASE_URL}}net_position_report.update_value_asset/np_id/"+id+"/value/"+value,
                               success: function(result){
                            
                            }
                            
                        });
                }
                </script>
       {{/if}}
    {{/if}}
    
    </td>
    <td>  
    {{if $item.np_type eq 'Liability'}}
    
        {{if $item.np_what eq 'NAFP'}}
         ${{$totval}}
        {{else}}
 
        <input type="text" name="val_liabilities" value="{{$item.np_liabilities}}" onkeyup="update_value_liabilities({{$item.np_id}},this.value)" />
        <script>
		function update_value_liabilities(id,value)
		{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}net_position_report.update_value_liabilities/np_id/"+id+"/value/"+value,
					   success: function(result){
					
					}
					
				});
		}
	    </script>
        {{/if}}
      {{/if}}  
    </td>
    
    <td>
    <div class="slidecontainer">
      
  <input type="range" min="0" max="100" value="{{$item.np_accuracy}}" class="slider" id="myRange_{{$countn}}" Onchange = "update({{$item.np_id}},this.value)" >
   <p>%: <span id="demo_{{$item.np_id}}"></span></p>
   
   </div>
   <div id = "up{{$item.np_id}}">{{$item.np_accuracy_user}}<br />{{$item.np_accuracy_date}} </div>
<script>
	var slider = document.getElementById("myRange_{{$countn}}");
	var output{{$item.np_id}} = document.getElementById("demo_{{$item.np_id}}");
	output{{$item.np_id}}.innerHTML = slider.value;
	slider.oninput = function() {
		output{{$item.np_id}}.innerHTML = this.value;
	}
	
		function update(id,value)
		{
			 var up = '#up'+id;
			 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}net_position_report.update_accuracy/np_id/"+id+"/value/"+value,
						   success: function(result){
							    $(up).html(result);
					   }
					 });
		}
	
</script>
    
    
    </td>
    <td>
    <form name="qaus" method="post" action="">
    <input type ="hidden" name="np_id" value="{{$item.np_id}}" />
    <input type="submit" name="qa" value="qa" />
    </form>
    {{$item.np_qa_user}}<br />{{$item.np_qa_date}}
    </td>
   
 </tr> 
 
 {{assign var=countn value=$countn-1}}
{{/foreach }} 
<tr style="color: #FFF;  font-size:18px;">
<td><strong>Total</strong> </td>
<td> </td>
 <td> </td>
 <td><strong>${{$total_ass|number_format:2:".":","}}</strong></td>
 <td><strong>${{$total_lia|number_format:2:".":","}}</strong> </td>
 <td> </td>
 </tr>
 </tbody>
</table>
<br /> <br />
<h3 class="page-title">Cash In Bank</h3> <br />
 <table id="list-table" class="nav-back" width="100%" >
        <thead>
            <tr>
                <th class="topmenu" align="center" valign="middle" width="10%">Days</th>   
                <th class="topmenu" align="center" valign="middle" width="10%">Value</th> 
                <th class="topmenu" align="center" valign="middle" width="15%">Accuracy</th>
                <th class="topmenu" align="center" valign="middle" width="15%">Who</th>
                <th class="topmenu" align="center" valign="middle" width="35%">Comments</th>
            </tr>
        </thead>
 <tbody>
  {{assign var=countn2 value= $total}}
   {{foreach from=$cashdata key="key2" item="item2"}}
 <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
    <td>{{$item2.cb_days}}</td>
     
    <td>    
    <input type="text" name="value" value="{{$item2.cb_value}}" style="width:150px;" onkeyup="update_value({{$item2.cb_id}},this.value)" />
    <script>
    function update_value(id,value)
		{
			
			 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}net_position_report.update_value/cb_id/"+id+"/value/"+value,
						   success: function(result){
							    
					   }
					 });
		}
	
   </script>
   </td>
    
    <td>
     <div class="slidecontainer">
      
  <input type="range" min="0" max="100" value="{{$item2.cb_accuracy}}" class="slider" id="myRange2_{{$countn2}}" Onchange = "update_acc({{$item2.cb_id}},this.value)" >
   <p>%: <span id="demo2_{{$item2.cb_id}}"></span></p>
   
   </div>

<script>
	var slider2 = document.getElementById("myRange2_{{$countn2}}");
	var output2{{$item2.cb_id}} = document.getElementById("demo2_{{$item2.cb_id}}");
	output2{{$item2.cb_id}}.innerHTML = slider2.value;
	slider2.oninput = function() {
		output2{{$item2.cb_id}}.innerHTML = this.value;
	}
	
		function update_acc(id,value)
		{
			
			 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}net_position_report.update_acc/cb_id/"+id+"/value/"+value,
						   success: function(result){
							    
					   }
					 });
		}
	
</script>
    </td>
    <td>
    <input type="text" name="who" value="{{$item2.cb_who}}" style="width:200px;" onkeyup="update_who({{$item2.cb_id}},this.value)" />
    <script>
    function update_who(id,value)
		{
			
			 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}net_position_report.update_who/cb_id/"+id+"/value/"+value,
						   success: function(result){
							    
					   }
					 });
		}
	
     </script>
    </td>

    <td>
    <input type="text" name="comment" value="{{$item2.cb_comments}}" style="width:400px;" onkeyup="update_comments({{$item2.cb_id}},this.value)" />
    <script>
    function update_comments(id,value)
		{
			
			 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}net_position_report.update_comments/cb_id/"+id+"/value/"+value,
						   success: function(result){
							    
					   }
					 });
		}
	
</script>
    </td>

  </tr>  
    {{assign var=countn2 value=$countn2-1}}
   {{/foreach}}
 </tbody>
 </table>
 <br />