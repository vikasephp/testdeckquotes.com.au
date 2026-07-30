{{if $_SESSION.user.user_poincc_access > 0}}
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

<script>
		!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
	</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />

<script type="text/javascript" > 
function showlert(po_id)
{
	var viewurl = "{{$BASE_URL}}poincc.alert"+ "/po_id/" + po_id;	
	
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

<script type="text/javascript" >  
		$(document).ready(function() {
			/*
			*   Examples - images
			*/
			$(".various").fancybox({
				'width': '95%',
				'height': '90%',
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
		
		
		
function add_procedure()
{
	var viewurl = "{{$BASE_URL}}poincc.view_procedure"+ "/random/" + Math.random();	

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

		

function add_new()
 {
var viewurl = "{{$BASE_URL}}poincc.detail"+ "/random/" + Math.random();	
 $(document).ready(function () {
        $.fancybox({
				'width': '85%',
				'height': '85%',
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


function close_win()
	{
	$.fancybox.close();
	window.location.reload();
	}
</script>

<style>

#fancybox-wrap {z-index:9999999;} 
.tooltip {
    position: relative;
   /* display: inline-block;*/
	border:0px solid !important;
	margin-top:5px;
    
}

.tooltip .tooltiptext {
    visibility: hidden;
    width: 500px;
    background-color: black;
    color: #fff;
    text-align: center;
    border-radius: 6px;
    padding: 5px 5px;
	display:block;
	margin-left:20px;

    /* Position the tooltip */
    position: absolute;
    z-index: 1;
}

.tooltip:hover .tooltiptext {
    visibility: visible;
}

.dtpic {
	width:65px !important;
	padding-top:1px !important;
	padding-bottom:1px !important;	
}

.set { font-size:10px !important; 
       width:25px !important; display:inline-block; 
	   padding-top:1px !important;
	   padding-bottom: 1px !important;
	   padding-left:1px !important;
	   height:25px !important; }
	   
	   
.wrapper1, .wrapper2{width: 1900px; border: none 0px RED;
overflow-x: scroll; overflow-y:hidden; scrollbar-color: yellow blue;}
.wrapper1{height: 20px; }
.wrapper2{height: 1200px; }
.div1 {width:2880px; height: 20px; }
.div2 {width:2880px; height: 1200px; overflow: auto;}   

	   

.multiselect {
  width: 280px;
  display:inline-block;
}


.multiselect3 {
  width: 200px;
  display:inline-block;
}


.selectBox {
  position: relative;
  
}

.selectBox select {
  width: 100%;
  font-weight: bold;
}

.overSelect {
  position: absolute;
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
}

#checkboxes {
  display: none;
  border: 1px #dadada solid;
    height: 150px;
  overflow-y:scroll;
}

#checkboxes label {
  display: block;
}

#checkboxes label:hover {
  background-color: #1e90ff;
}


#checkboxes1 {
  display: none;
  border: 1px #dadada solid;
    height: 150px;
  overflow-y:scroll;
}

#checkboxes1 label {
  display: block;
}

#checkboxes1 label:hover {
  background-color: #1e90ff;
}


#checkboxes2 {
  display: none;
  border: 1px #dadada solid;
    height: 150px;
  overflow-y:scroll;
}

#checkboxes2 label {
  display: block;
}

#checkboxes2 label:hover {
  background-color: #1e90ff;
}

#checkboxes3 {
  display: none;
  border: 1px #dadada solid;
    height: 350px;
  overflow-y:scroll;
}

#checkboxes3 label {
  display: block;
}

#checkboxes3 label:hover {
  background-color: #1e90ff;
}

#checkboxes4 {
  display: none;
  border: 1px #dadada solid;
    height: 150px;
  overflow-y:scroll;
}

#checkboxes4 label {
  display: block;
}

#checkboxes4 label:hover {
  background-color: #1e90ff;
}


#checkboxes5 {
  display: none;
  border: 1px #dadada solid;
  height: 150px;
  overflow-y:scroll;
}

#checkboxes5 label {
  display: block;
}

#checkboxes5 label:hover {
  background-color: #1e90ff;
}



	.blink-bg{
		color: #fff;
		padding: 6px;
		display: inline-block;
		border-radius: 3px;
		animation: blinkingBackground 2s infinite;
	}
	@keyframes blinkingBackground{
		0%		{ background-color: #10c018;}
		25%		{ background-color: #1056c0;}
		50%		{ background-color: #ef0a1a;}
		75%		{ background-color: #254878;}
		100%	{ background-color: #04a1d5;}
	}
   
</style>

<h3 class="page-title">{{$title}}</h3>
<br />

<script type="text/javascript">
$(function(){
    $(".wrapper1").scroll(function(){
        $(".wrapper2")
            .scrollLeft($(".wrapper1").scrollLeft());
    });
    $(".wrapper2").scroll(function(){
        $(".wrapper1")
            .scrollLeft($(".wrapper2").scrollLeft());
    });
});
</script>


<script>
var expanded = false;

function showCheckboxes() {
  var checkboxes = document.getElementById("checkboxes");
  if (!expanded) {
    checkboxes.style.display = "block";
    expanded = true;
  } else {
    checkboxes.style.display = "none";
    expanded = false;
  }
}

function showCheckboxes1() {
  var checkboxes = document.getElementById("checkboxes1");
  if (!expanded) {
    checkboxes.style.display = "block";
    expanded = true;
  } else {
    checkboxes.style.display = "none";
    expanded = false;
  }
}

function showCheckboxes2() {
  var checkboxes = document.getElementById("checkboxes2");
  if (!expanded) {
    checkboxes.style.display = "block";
    expanded = true;
  } else {
    checkboxes.style.display = "none";
    expanded = false;
  }
}

function showCheckboxes3() {
  var checkboxes = document.getElementById("checkboxes3");
  if (!expanded) {
    checkboxes.style.display = "block";
    expanded = true;
  } else {
    checkboxes.style.display = "none";
    expanded = false;
  }
}

function showCheckboxes4() {
  var checkboxes = document.getElementById("checkboxes4");
  if (!expanded) {
    checkboxes.style.display = "block";
    expanded = true;
  } else {
    checkboxes.style.display = "none";
    expanded = false;
  }
}

function showCheckboxes5() {
  var checkboxes = document.getElementById("checkboxes5");
  if (!expanded) {
    checkboxes.style.display = "block";
    expanded = true;
  } else {
    checkboxes.style.display = "none";
    expanded = false;
  }
}

</script>



<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
<div style="float:left;text-align:left; margin-left:10px;">

<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /><br />
{{if !empty($sql) }}<input type="hidden" name="sql" value="{{$sql}}"  /> {{/if}}

<!--<datalist id='project'>

{{foreach from=$suplist key="key" item="item"}}
    <option value="{{$item.po_supplier}}" {{if $bsnid eq $item3.bsn_id}} selected="selected" {{/if}}>
   {{$item.po_supplier}}
    </option>
{{/foreach}}
</datalist>
Supplier :
<input type="text" list = 'project' name="supplier" style ="width:268px" value="{{$p_c_name}}" />
<!--<input type="submit" value="Search" name="search"   {{$class5}} /> -->

<!--{{if $data2 }} <span style="color:#639; font-weight:bold;"> Supplier Searched : {{$data2}} </span> {{/if}}-->

<br />

Supplier :

<input type="text" name="supplier_search" style="width:250px;" />

<br />
<!---------Project Search--------------->
Project :
<div class="multiselect" >
    <div class="selectBox" onclick="showCheckboxes2()" >
      <select>
        <option>Select Project</option>
      </select>
      <div class="overSelect"></div>
    </div>
    <div id="checkboxes2">
    
    {{foreach from=$projlist key="key" item="item"}}
    	<label for="one{{$item.po_id}}">
        <input type="checkbox" id="one_{{$item.po_id}}" name="project[{{$item.po_id}}]" value="{{$item.po_project_number}}" />{{$item.po_project_number}}</label>
    {{/foreach}}
    </div>
</div>

<!--<input type="submit" value="Search" name="search_project"   {{$class7}} /> -->
{{if $data3 }} <span style="color:#639; font-weight:bold;"> Project Searched : {{$data3}} </span> {{/if}}

<br />
<!---------Myboid Search--------------->
Myobid :
<div class="multiselect" >
    <div class="selectBox" onclick="showCheckboxes3()" >
      <select>
        <option>Select Myboid</option>
      </select>
      <div class="overSelect"></div>
    </div>
    <div id="checkboxes3">
    
    {{foreach from=$myobidlist key="key" item="item"}}
    	<label for="one{{$item.po_id}}">
        <input type="checkbox" id="one_{{$item.po_id}}" name="myboid[{{$item.po_id}}]" value="{{$item.po_myobid}}" />{{$item.po_myobid}}</label>
    {{/foreach}}
    </div>
</div>
<br />
<!--<input type="text" name="myobid_search" style="width:250px;" />-->
Myobid Broad Search:
<input type="text" name="myobid_broad_search" style="width:250px;" />

<!--<input type="submit" value="Search" name="search_myboid"   {{$class8}} /> -->
{{if $data4 }} <span style="color:#639; font-weight:bold;"> Myboid Searched : {{$data4}} </span> {{/if}}

<!---------Myobid Search Ends--------------->

<br />


<!---------Type Search--------------->

Type :
<div class="multiselect" >
    <div class="selectBox" onclick="showCheckboxes4()" >
      <select>
        <option>Select Type</option>
      </select>
      <div class="overSelect"></div>
    </div>
    <div id="checkboxes4">
    
    {{foreach from=$typelist key="key" item="item"}}
    	<label for="one{{$item.po_id}}">
        <input type="checkbox" id="one_{{$item.po_id}}" name="type[{{$item.po_id}}]" value="{{$item.po_type}}" />{{$item.po_type}}</label>
    {{/foreach}}
    </div>
</div>


<br />
Invoice Number :
<!--<div class="multiselect" >
    <div class="selectBox" onclick="showCheckboxes5()" >
      <select>
        <option>Select Invoice Number</option>
      </select>
      <div class="overSelect"></div>
    </div>
    <div id="checkboxes5">
    
    {{foreach from=$invoicelist key="key" item="item"}}
    	<label for="one{{$item.po_id}}">
        <input type="checkbox" id="one_{{$item.po_id}}" name="invoice_no[{{$item.po_id}}]" value="{{$item.po_invoice_number}}" />{{$item.po_invoice_number}}</label>
    {{/foreach}}
    </div>
</div>-->

<input type="text" name="inv_no" style="width:250px;" />

<input type="submit" value="Search" name="search_all"   {{$class10}} /> 
{{if $data5 }} <span style="color:#639; font-weight:bold;"> Type Searched : {{$data5}} </span> {{/if}}

&nbsp; &nbsp; <input type="submit" value="Clear All Search" name="clearall"  {{$class9}} />



<!---------Type Search Ends--------------->


</div>


<!--<br />
Search By MYOBID : <input type="text" name="myboid_search" value="{{$myobids}}" style="width:400px;" placeholder="Type myboid each separated by comma"/>
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" value="Search" name="myobidsearch"  {{$class12}} />-->
<br />

<input type="submit" value="Show Invoices Approved But Not Payed" name="notpayed" id="np" {{$class1}}  /> 
<input type="submit" value="Show Invoice Not Approved" name="notapproved" {{$class2}}  /> 
<input type="submit" value="Show All" name="showall" {{$class3}}   />
<input type="submit" value="MYOB approved but not entered" name="myobabne" {{$class4}}   />
<input type="submit" value="Merge Invoices Pdf" name="merge" {{$class6}}   id ="submitBtn"/>
<input type="submit" value="Show rows with alerts" name="showalert" {{$class11}} />
<input type="submit" value="Show Rejected Invoice" name="rejected" {{$class13}} />

<img src="{{$BASE_URL}}images/loading2.gif"  id="show" style="display:none;"/> 

{{if $download eq 'true' }}
 <a href = "{{$BASE_URL}}files/merged/{{$fn}}" target="_blank" > 
<!-- <span style=" background:#039; color:#FFF; padding:5px; font-weight:bold; border-radius:4px;">Click here to show merged pdf</a> </span>-->
  <span class="blink-bg">Click here to show merged pdf</a> </span>
{{/if}}

<script type="text/javascript" language="javascript">

$(document).ready(function(){

    $("#submitBtn").click(function(){        
		
			 $('#show').css('display', 'block');
    });
});

</script>

</form>
</div>


<div style="float:right;"> <input type="button" name="Add New " value="Add New" onclick="javascript:add_new();" disabled="disabled" /> </div>


<div class="wrapper1">
    <div class="div1">
    </div>
</div>

<div class="wrapper2">
    <div class="div2">
  <table id="doclist-table" class="nav-back" width="100%" >
    <thead>
      <tr>
        <th class="topmenu" align="center" valign="middle" width="2%">URN</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Type</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Linked Purchase Order</th>
        <th class="topmenu" align="center" valign="middle" width="4%">P Or NP</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Purchase Order</th>
        <th class="topmenu" align="center" valign="middle" width="5%">PO Number</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Value of PO</th>
        <th class="topmenu" align="center" valign="middle" width="6%">Chart of Acc</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Project Number</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Email Date</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Invoice No</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Supplier</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Invoice</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Invoice Date</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Invoice Due Date</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Invoice Value</th>
        <th class="topmenu" align="center" valign="middle" width="5%">US Invoice Value</th>
        <th class="topmenu" align="center" valign="middle" width="5%">1st Q/A</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Entered In MYOB</th>
        <th class="topmenu" align="center" valign="middle" width="4%">MYOBID</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Invoiced Approved<br />Payment</th>
        <th class="topmenu" align="center" valign="middle" width="9%">Invoiced Payed</th>
        <th class="topmenu" align="center" valign="middle" width="9%">Alert</th>
        <th class="topmenu" align="center" valign="middle" width="2%">Action</th>
      </tr>
    {{if $list}}
    <tbody>
    <form name="mlist" method="post">
      {{assign var=countn value= $numstartvounter}}
      {{foreach from=$list key="key" item="item"}}
      <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
        <td>{{$item.po_urn}}</td>
        <td>{{$item.po_type}}</td>
        <td>{{if $item.po_link_po eq 1}} Yes {{else}} No {{/if}}</td>
        <td>
        
        <form name ="pornp" method="post" action="">
        	<select name="po_pornp[{{$item.po_id}}]" style="width:116px;" onchange="this.form.submit();"/>
        		    <option value="Not Determined" {{if  $item.po_pornp == 'Not Determined'}}selected{{/if}}>Not Determined</option>
                     <option value="Project" {{if  $item.po_pornp  == 'Project'}}selected{{/if}}>Project</option>
                     <option value="Non-Project" {{if $item.po_pornp  == 'Non-Project'}}selected{{/if}}>Non-Project</option>
                    </select>  
         
        </form>
         
        </td>
        <td>{{if $item.po_purchase_order_doc}}
       <!-- <a href="https://deckquote.s3.amazonaws.com/files/purchase_order_invoice/{{$item.po_purchase_order_doc}}" target="_blank">View / Download</a>-->
       <a href="/poincc.download_content?file_name={{$item.po_purchase_order_doc}}&module_name=poincc.home" >Download</a>{{/if}}
       
       </td>
        <td>{{$item.po_purchase_order_no}}</td>
        <td>{{$item.po_po_value}}</td>
        <td>
         <form name ="recmet" method="post" action="" id="myForm">
        <input type="text" name="po_chartof_acc[{{$item.po_id}}]"  value="{{$item.po_chartof_acc}}"  style="width:60px;" /> 
             <!--<input type="submit" value="Set" name="myob" class="set" />-->
            <input type=image src="{{$BASE_URL}}images/save.png" alt="Save" title="Save">
       </form>
         </td>
        <td>{{$item.po_project_number}}</td>
        <td>{{$item.po_email_date}}</td>
        <td>{{$item.po_invoice_number}}</td>
        <td>{{$item.po_supplier}}</td>
        <td>
       		<div class="tooltip">
            {{if $item.po_invoice_doc}}
                <!--<a href="https://deckquote.s3.amazonaws.com/files/purchase_order_invoice/{{$item.po_invoice_doc}}?dummy={{$ran}}" target="_blank" style="padding-bottom:2px;">View / Download</a>-->
               <a href="/poincc.download_content?file_name={{$item.po_invoice_doc}}&module_name=poincc.home" >Download</a> 
                
                <span class="tooltiptext">{{$item.po_supplier}} - {{$item.po_po_value}} - {{$item.po_project_number}} - {{$item.po_invoice_number}}</span>
            {{/if}} 
            </div>
        <!--{{if $item.po_invoice_doc}} <a href="{{$BASE_URL}}files/purchase_order_invoice/{{$item.po_invoice_doc}}" target="_blank">View / Download</a> {{/if}}-->
        </td>
        <td>{{$item.po_invoice_date}}</td>
        <td>{{$item.po_invoice_due_date}}</td>
        
		<td>{{$item.po_invoice_value}}</td>
        <td>{{$item.po_us_invoice_value}}</td>
        
       {{if $item.po_first_qa  eq 'Approved for MYOB' }} <td style="background:#090;">
       
       {{elseif  $item.po_first_qa  eq 'Email back wrong details' ||  $item.po_first_qa  eq 'Rejected' }} <td style="background: #F00;"> {{else}}
        <td> {{/if}}
        <form name ="recmet" method="post" action="">
        <select name="po_first_qa[{{$item.po_id}}]" style="width:167px;" onchange="this.form.submit();"/>
        			 <option value="0" {{if  $item.po_first_qa == '0'}}selected{{/if}} >Not Yet Determined </option>
                     <option value="Approved for MYOB" {{if  $item.po_first_qa == 'Approved for MYOB'}}selected{{/if}}>Approved for MYOB</option>
                     <option value="Email back wrong details" {{if  $item.po_first_qa  == 'Email back wrong details'}}selected{{/if}}>Email back wrong details</option>
                     <option value="Rejected" {{if $item.po_first_qa  == 'Rejected'}}selected{{/if}}>Rejected</option>
                     <option value="Paid directly before approval" {{if $item.po_first_qa  == 'Paid directly before approval'}}selected{{/if}}>Paid directly before approval</option>
        </select> 
        </form>
        </td>
        <td>
        <form name ="recmet" method="post" action="">
    		<input type="hidden" name="savetorm[{{$item.po_id}}]" value="0" />
     		<label class="switch">
        	<input class="switch-input" type="checkbox"  name="savetorm[{{$item.po_id}}]" value="1"  onclick="this.form.submit();" {{if $item.po_enter_in_myob eq 1 }} checked="checked" {{/if}} />
        	<span class="switch-label" data-on="Yes" data-off="No"></span> 
        	<span class="switch-handle"></span> <br />
             </label>
           {{if $item.po_enter_in_myob eq 1}}
          	 <input type="text" name="po_enter_myob[{{$item.po_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo1_{{$item.po_id}}" value="{{$item.po_myob_date}}"  /> 
             <input type="submit" value="Set" name="myob" class="set" />
             <br />
            User: {{$item.po_myob_user}} {{/if}} <br />   
             
   		 </form> 
         
       
         </td>
         
         <td> {{$item.po_myobid}} </td>
         
        <td>
        
         <form name ="recmet" method="post" action="">
        <select name="po_in_approved_payment[{{$item.po_id}}]" style="width:167px;" onchange="this.form.submit();"/>
        			 <!--<option value="0" {{if  $item.po_first_qa == '0'}}selected{{/if}} >Not Yet Determined </option>-->
                     <option value="0" {{if $item.po_in_approved_payment == '0'}}selected{{/if}}>Not Yet determined</option>
                     <option value="1" {{if $item.po_in_approved_payment == '1'}}selected{{/if}}>Approved for Payment </option>
                     <option value="2" {{if $item.po_in_approved_payment == '2'}}selected{{/if}}>Payment not approved</option>
                     
        </select> 


             {{if $item.po_in_approved_payment eq 1}}  
       	     <input type="text" name="po_app_date[{{$item.po_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo2_{{$item.po_id}}" value="{{$item.po_appoved_date}}"  /> 
             <input type="submit" value="Set" name="apdate" class="set" />
             <br />
           
            User: {{$item.po_approved_user}} {{/if}} 
   		 </form> 
            
        
        </td>
        <td>
         
         <form name ="recmet2" method="post" action="">
    		<input type="hidden" name="savetorm3[{{$item.po_id}}]" value="0" />
     		<label class="switch">
        	<input class="switch-input" type="checkbox"  name="savetorm3[{{$item.po_id}}]" value="1"  onclick="this.form.submit();" {{if $item.po_invoice_payed eq 1 }} checked="checked" {{/if}} />
        	<span class="switch-label" data-on="Yes" data-off="No"></span> 
        	<span class="switch-handle"></span> <br />
             </label>
             {{if $item.po_invoice_payed eq 1}}  
       	     <input type="text" name="po_invoice_date[{{$item.po_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo3_{{$item.po_id}}" value="{{$item.po_in_payed_date}}"  /> 
             <input type="submit" value="Set" name="invdate" class="set" />
             <br />
           
            User: {{$item.po_in_payed_user}} {{/if}} 
   		 </form> 
        
        
        
        </td>
        
        {{if !empty($item.po_alert_text)}}
        <td style="background:#F00;">
		{{else}}
        <td>
        {{/if}}
		         <input type="button" name="Alert" value="Read Alert" onclick="javascript:showlert({{$item.po_id}});" style="width:90px; height:20px; font-size:11px; line-height:17px !important; padding:0px !important" />
         </td>
        
        
        <td><a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" class="various" title="Edit"> <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>
          <!-- {{if $USER_GROUP == 'Administrators'}} -->
          <a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}" onclick="javascript:if(!confirm('Are you sure want to delete the listing? Because it will delete all the document related to this listing.')) return false;" title="Delete"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>
          <!--   {{/if}}-->
        </td>
      </tr>
      {{assign var=countn value=$countn+1}}
      {{/foreach}}
      </tbody>
      
    </form>
    {{/if}}
    
  </table>

  {{if $last > 1}}
  <table width="90%" border="0" cellpadding="0" cellspacing="0">
    <tr> {{if $list}}
      <td align="center"><div class='pagination'> {{if $pagenum == 1}} <span class='disabled'><< previous</span> {{else}} <a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{math equation="x - y" x=$pagenum y=1}}" title="Previous"><< previous</a> {{/if}}
          
          {{if $pagenum != 1}} <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/1" title="{{$page_num}} Page">1</a></span> {{else}}<span class='current'>1</span> {{/if}}{{if $pagenum != 2}} <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/2" title="{{$page_num}} Page">2</a></span> {{else}}<span class='current'>2</span> {{/if}}
          {{if $paginateprev.0 > 3}}
          ...
          {{/if}}
          {{foreach from=$paginateprev key="page_key" item="page_num"}}
          {{if $page_num == $pagenum OR $page_num <= 2}}
          {{elseif $page_num == $lastone}}
          
          {{else}} <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$page_num}}" title="{{$page_num}} Page">{{$page_num}}</a></span> {{/if}}
          {{/foreach}}
          
          {{foreach from=$paginatenext key="page_key" item="page_num2"}}
          {{if $page_num2 < $last AND $page_num2 != $lastone}}
          {{if $page_num2 == 1}}
          {{elseif $page_num2 == 2}}
          {{else}}
          {{if $page_num2 == $pagenum OR $page_num2 <= 0}} <span class='current'> {{$page_num2}}</span> {{else}} <a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$page_num2}}" title="{{$page_num2}} Page">{{$page_num2}}</a> {{/if}}
          {{/if}}     
          {{/if}}
          {{/foreach}}
          {{if $page_num2 < $lasttow}}
          ...
          {{/if}}
          {{if $lastone == 1}}
          {{elseif $lastone == 2}}
          {{else}}
          {{if $pagenum == $lastone }} <span class='current'>{{$lastone}}</span> {{else}} <a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$lastone}}" title="{{$lastone}} Page">{{$lastone}}</a> {{/if}}
          {{/if}}
          {{if $last == 1}}
          {{elseif $last == 2}}
          {{else}}
          {{if $pagenum == $last}} <span class='current'>{{$last}}</span> {{else}} <a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$last}}" title="{{$last}} Page">{{$last}}</a> {{/if}}
          {{/if}}
          {{if $pagenum == $last}} <span class='disabled'>next >></span> {{else}} <a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{math equation="x + y" x=$pagenum y=1}}" title="Next">next >></a></div>
        {{/if}} </td>
      {{else}}
      <td align="center" height="300">Record Not found... </td>
      {{/if}} </tr>
  </table>
  {{/if}} <br />
  <br />

</div>
</div>
{{/if}}