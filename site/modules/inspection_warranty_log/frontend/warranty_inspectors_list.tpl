<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
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
<div align="center" style="min-height: 350px; z-index: 9999999;">
	<h3 class="page-title" style="margin: 30px 0;">Warranty Inspectors List</h3>
    <div style="float: right; margin-right: 10px; background: #09F; color: #FFF !important; padding: 6px; margin-bottom: 5px;">
        <a href="{{$BASE_URL}}{{$BASEFOLDER}}.warranty_inspectors_detail" class="various" title="Add" style="color: #FFF; text-decoration: none; font-size: 14px;">Add New</a>
    </div>
    <table id="list-table" width="99%">
        <tr>
            <th>S.N.</th>
            <th>Name</th>
            <th>Mobile</th>
            <th>Email</th>
            <th>Activate/deactivate</th>
            <th>Action</th>
        </tr>
        {{foreach from=$list key="key" item="item"}}
            <tr>
                <td>{{counter}}</td>
                <td>{{$item.wi_name}}</td>
                <td>{{$item.wi_mobile}}</td>
                <td>{{$item.wi_email}}</td>
                {{if $item.wi_is_admin != 1}}
                <td>
                    <form name="recmet3" method="post" action="" style="margin-bottom: 0;">
                        <input type="hidden" name="wi_is_active[{{$item.wi_id}}]" value="0">
                        <label class="switch" style="margin: 0;">
                            <input class="switch-input" type="checkbox" name="wi_is_active[{{$item.wi_id}}]" value="1" onclick="this.form.submit();" {{if $item.wi_is_active eq 1 }}checked{{/if}}>
                            <span class="switch-label" data-on="Yes" data-off="No"></span>
                            <span class="switch-handle"></span>
                        </label>
                    </form>                        
                </td>
                <td>
                    <a href="{{ $BASE_URL }}{{ $BASEFOLDER }}.warranty_inspectors_detail/wi_id/{{$item.wi_id}}" class="various" title="Edit"><img style="height:20px; width:20px;" src="{{ $BASE_URL }}css/admin/images/edit.png" alt="" /></a>
                </td>
                {{else}}
                <td></td>
                <td></td>
                {{/if}}
            </tr>
        {{/foreach}}
    </table>
</div>