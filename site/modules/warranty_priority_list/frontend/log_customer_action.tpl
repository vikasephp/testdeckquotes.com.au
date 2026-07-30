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
    <h3 class="page-title"><br />Customer Action</h3>    
   
   
<table id="list-table" width="99%">
	<tr> 
		<th width="5%">SrNo</th>
		<th width="70%">List of Customer Action </th>
		<th width="10%">Required</th>
	</tr>
	{{foreach from=$typedata item=item}}
	<tr>
		<td>{{counter}}</td>
		<td>{{$item.wlca_name}}</td>
		<td>
            {{assign var="is_checked" value=false}}
            {{foreach from=$wlca item=item_wlca}}
                {{if $item_wlca.wlcar_wlca_id eq $item.wlca_id}}
                    {{assign var="is_checked" value=true}}
                {{/if}}
            {{/foreach}}

            <form method="post" action="">
                <input type="hidden" name="wlca_id" value="{{$item.wlca_id}}">
                <input type="hidden" name="wa_id" value="{{$wa_id}}">
                <input type="hidden" name="bsn_id" value="{{$bsn_id}}">
                <input type="hidden" name="action_required" id="action_required_{{$item.wlca_id}}" value="0">

                <label class="switch">
                    <input type="checkbox" class="switch-input"
                           onchange="document.getElementById('action_required_{{$item.wlca_id}}').value = this.checked ? 1 : 0; this.form.submit();"
                           {{if $is_checked}}checked="checked"{{/if}}>
                    <span class="switch-label" data-on="Yes" data-off="No"></span>
                    <span class="switch-handle"></span>
                </label>
            </form>
        </td>
	</tr>
	{{/foreach}}

</table><br /><br />
<input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
    
    <script type="text/javascript">
		function closepop() {
			setTimeout(function() {
				parent.$.fancybox.close();
			}, 500);
		}
	</script>
	
</div>