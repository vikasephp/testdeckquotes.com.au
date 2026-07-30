<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

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

<style>
form, .switch {
  margin-bottom: 0;
}
</style>

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
<h3 class="page-title"><br />View CGFB Direct Costs Notes</h3>       
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<div style="float:right; margin-right:10px; background: #09F; color:#FFF !important; padding:6px; margin-bottom:5px;"> 
<a href="{{$BASE_URL}}warranty_log2.add_cgfbdirectcosts_notes/wa_id/{{$wa_id}}" class="various" title="Edit" style="color:#FFF; text-decoration:none; font-size:14px;">Add New CGFB Direct Costs Notes</a>
</div>

<table id="list-table" width="99%">
	<tr> 
		<th width="5%">SrNo</th>
		<th width="40%">Notes </th>
		<th width="8%">Added By </th>
		<th width="8%">Added Date </th>
		<th width="7%">Add To Main Notes</th>
		<th width="7%">Action</th>
	</tr>
	{{if $typedata}}
   {{foreach from=$typedata key="key" item="item"}}
	<tr>
		<td>{{counter}}</td>
		<td>{{$item.cdcn_notes}}</td>
		<td>{{$item.cdcn_added_by}}</td>
		<td>{{$item.cdcn_added_date|date_format:"%d-%m-%Y"}}</td>
		<td>
			<form method="post" action="">
				<input type="hidden" name="cdcn_add_to_main_notes[{{$item.cdcn_id}}]" value="0">
                <label class="switch">
                    <input type="checkbox" class="switch-input" name="cdcn_add_to_main_notes[{{$item.cdcn_id}}]" value="1"  onclick="update_add_to_main_notes({{$item.cdcn_id}}, this.checked);" {{if $item.cdcn_add_to_main_notes eq 1}}checked="checked"{{/if}}>
                    <span class="switch-label" data-on="Yes" data-off="No"></span>
                    <span class="switch-handle"></span>
                </label>
            </form>
			<script>
				function update_add_to_main_notes(id, value) {
					var val = 0;
					if (value == true) { val = 1; }
					if (value == false) { val = 0; }
					$.ajax({
						type: "GET",
						url: "{{$BASE_URL}}warranty_log2.update_add_to_main_notes/cdcn_id/" + id + "/value/" + value,
						success: function (result) {
						}
					});
				}
			</script>
		</td>
		<td>
		 <a href="{{$BASE_URL}}warranty_log2.add_cgfbdirectcosts_notes/wa_id/{{$wa_id}}/cdcn_id/{{$item.cdcn_id}}" class="various" title="Edit"> 
			<img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
		 <a href="{{$BASE_URL}}warranty_log2.delete_cgfbdirectcosts_notes/wa_id/{{$wa_id}}/cdcn_id/{{$item.cdcn_id}}" onclick="javascript:if(!confirm('Are you sure want to delete this Note?')) return false;" title="Delete">     <img style="height: 16px;; width:16px" src="{{$BASE_URL}}css/admin/images/deletecross.png"/></a>
		</td>
	</tr> 
  {{/foreach}}
  {{else}}
  <tr>
	<td colspan="5" style="text-align: center;">No Notes Available</td>
  </tr>
  {{/if}}
</table><br /><br />
<input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
</form>
    
	<script type="text/javascript">
		function closepop() {
			setTimeout(function() {
				//parent.$.fancybox.close();
				parent.location.reload();
			}, 500);
		}
	</script>
    
	<script type="text/javascript" language="javascript" >
        var frmvalidator  = new Validator("detail");
		frmvalidator.EnableMsgsTogether();			
    </script>
</div>

<script>
	initSample();
</script>