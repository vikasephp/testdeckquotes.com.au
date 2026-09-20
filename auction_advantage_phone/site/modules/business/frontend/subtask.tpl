
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />

<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>


<div>
 <h3 class="page-title">Task {{$tid}} - Subtask List</h3>
 
 {{if $msg }}
 	<h2 style="text-align:center; padding-top:30; font-size:24px;">{{$msg }} </h2>
  {{else}}
  
 <table cellpadding="5" cellspacing="0" width="95%" border="1" id="list-table">
  <tr> <th width="60%">Sub Task</th><th width="10%">Linked Procedure</th><th width="10%"> Ms Team Link</th> <th> Completed </th> <th> Not Required </th> </tr>
  <form name="sta" method="post" action="">
  
  {{foreach from=$subtaskdata key="key" item="item"}} 
  {{if $item.bts_complete eq 0}}
  		<tr id="gr{{$item.bts_id}}" style="background: #F00; color:#FFF;" >
  {{else}}
    	<tr id="gr{{$item.bts_id}}" >
  {{/if}}
  		<td> {{$item.bts_task_name}} </td>
  <td>
    {{foreach from=$subtaskdata_lp key="keylp" item="itemlp"}}
    
    {{if $item.bts_bsst_id eq $itemlp.bstlp_bsst_id }}
     <a href="{{$BASE_URL}}/files/template_documents_hub/{{$itemlp.bstlp_doc_name}}" style="color:#06C;">{{$itemlp.bstlp_doc_name}}</a> &nbsp; &nbsp; &nbsp;
    {{/if}}
    
    {{/foreach}}
  </td>

  <td>
   {{foreach from=$subtaskdata_msteam key="keylp" item="itemlp"}}
    
    {{if $item.bts_bsst_id eq $itemlp.bstlp_bsst_id }}
    {{if $itemlp.dhd_link_pdf}}<a href="{{$itemlp.dhd_link_pdf}}"  style="color:#06C;" target="_blank">DID{{$itemlp.bstlp_doc_name}}-PDF</a><br />{{/if}}
    {{if $itemlp.dhd_link_word}}<a href="{{$itemlp.dhd_link_word}}" style="color:#06C;" target="_blank">DID{{$itemlp.bstlp_doc_name}}-Word</a><br />{{/if}}
 
    {{/if}}
    
    {{/foreach}}
  
  </td>	
  <td>
  <input type hidden name = "task[{{$item.bts_id}}][bts_id]" value = "{{$item.bts_id}}"  />
  <input type="checkbox" id="stsave{{$item.bts_id}}"  onchange="process({{$item.bts_id}})" name="task[{{$item.bts_id}}][bts_task_completed]" {{if $item.bts_complete eq 1}} checked="checked" {{/if}} />
  <span id="myElem{{$item.bts_id}}" style="display:none;">  </span> 
  </td>
  
  <td><input type="checkbox" id="stsave2{{$item.bts_id}}" onchange="process({{$item.bts_id}})" name="task[{{$item.bts_id}}][bts_not_required]" {{if $item.bts_not_required eq 1}} checked="checked" {{/if}} />
  <span id="myElem2{{$item.bts_id}}" style="display:none;">  </span> 
  </td> 
  
  {{/foreach}}
  
  </table>
  
  <input type="submit" name="st_save" value="save" />
  
  {{/if}}
</div>
<script type="text/javascript"> 

function process(bts_id)
		{
			//alert(bts_id);
			var idv = '#stsave'+ bts_id;
			var gr = '#gr'+bts_id
			var sa = '#myElem'+bts_id;
			
				if($(idv).is(':checked')) {
	
					var value = 1;
						$(gr).css('background', '#FFF')
						$(gr).css('color', '#000')	
						$(sa).css('color', '#0C0' );
						$(sa).show();
			   			//setTimeout(function() { $(sa).hide(); }, 3000);
									
					}
				else {
					var value = 0;
				    	$(gr).css('background', '#F00')
						$(gr).css('color', '#FFF')
						$(sa).css('color', '#0C0');
						$(sa).show();
			   			//setTimeout(function() { $(sa).hide(); }, 3000);
				}
		
			
		}
		
		

function process2(bts_id)
		{
			var idv = '#stsave2'+ bts_id;
			var gr = '#gr'+bts_id
			var sa = '#myElem2'+bts_id;
			var comp = '#stsave'+bts_id;
				if($(idv).is(':checked')) {
	
					var value = 1;
						$(gr).css('background', '#ccc')
						$(gr).css('color', '#000')	
						$(sa).css('color', '#0C0' );
						$(sa).show();
						$(comp).attr('disabled', true);
						$(comp).attr('checked', false);
			   			setTimeout(function() { $(sa).hide(); }, 3000);
									
					}
				else {
					var value = 0;
				    	$(gr).css('background', '#F00')
						$(gr).css('color', '#FFF')
						$(sa).css('color', '#0C0');
						$(sa).show();
						$(comp).attr('disabled', false);
			   			setTimeout(function() { $(sa).hide(); }, 3000);
				}
		
			
		}		


		
</script>