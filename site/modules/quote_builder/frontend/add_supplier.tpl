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
    <h3 class="page-title"><br />Select Suppliers </h3>    
     
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<div style="float:right; margin-right:10px; background: #09F; color:#FFF !important; padding:6px; margin-bottom:5px;"> 
<input type="button" onclick="appendRowLp()" value="Add New"  /> </div>
</form>

<form name="detail" method="post" action="{{$BASE_URL}}quote_builder.detail_new"  enctype="multipart/form-data">
<table id="list-table" width="99%">
<tr> 
<th width="80%">Suppliers</th><th width="20%"></th>
       

</table><br /><br />
<input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
<input type="submit" name="show_cont" value="Show"  class="vsml" />
</form>
     <datalist id='sup'>
           {{foreach from=$compdetail  key="key2" item="item2"}}
            <option value="{{$item2.co_company_name}}" {{if $detail.wa_supplier eq $item2.co_company_name}} selected="selected" {{/if}}>
            {{$item2.co_company_name}}
            </option>
            {{/foreach}}
     </datalist>  
  
   <script type="text/javascript">
		var x=0;
		var v=1;
		function appendRowLp()
		{
			
			id=1;
			var e = "#em" + x;
			v = $(e).val();
		
			if( v !== "" || x==0)
			{
			    $(e).attr("disabled", "disabled"); 
				x=x+1;
				var id2 = "#em"+x;
				
				var row = '<tr id="r'+x+'">';
				row =  row + '<td> <input type="text" name="supp"  list = "sup" id="em'+x+'" size="100" onkeyup=savefeature(this.value,'+id+','+x+'); /></td>';
				row =  row + '<td>';
				row =  row + '<a href="javascript:delete_feature_row('+x+');" value="Delete Fearure" title="Show Contacts" >';
				row =  row + '<img style="margin-top:5px;" src="{{$BASE_URL}}css/admin/images/deletecross.png"/></a></td>';
				row =  row + '</tr>';
				 
				 $("#list-table").append(row);
				
				 if( typeof v !== "undefined") {	
				  
				  $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}quote_builder.save_supplier/value/"+v,
						   success: function(result){
					   }
					 });
				 }
			  } else { 
				$("#myElem").show();
				setTimeout(function() { $("#myElem").hide(); }, 2000);
			   }
		}
				
		function delete_feature_row(x)
				{
					var id3 = "em"+x;
					
					var v = document.getElementById(id3).value;
					alert(v);
					dr = '#r'+ x;
					$(dr).remove();
				}
		
				
	</script>			  
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