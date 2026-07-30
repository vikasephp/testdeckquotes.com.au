<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
{{if $added}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}
<div align="center"><h3 class="page-title">Add Advert Record</h3>
{{if $error}}
<div style="font-size:17px; padding-top:50px;">Business Not exist.</div>
{{else}}
{{if !$added}}
<div style="padding:20px; font-size:17px;">Are you sure want to create advert record.</div>
<div><form action="" method="post" name="create"><input type="submit" name="add" value="Yes" />&nbsp;&nbsp;&nbsp;<input type="button" name="Cancel" value="Cancel" onclick="parent.$.fancybox.close();" /></form>
{{else}}
<div style="font-size:17px; padding-top:50px;">Record created successfully.</div>
{{/if}}

{{/if}}
</div>
</div>