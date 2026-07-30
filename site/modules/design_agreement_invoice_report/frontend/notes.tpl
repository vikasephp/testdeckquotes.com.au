<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />


<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>

{{if $opr}}
<script type="text/javascript">
javascript:parent.$.fancybox.close();
</script>
{{/if}}


<div align="center" style="padding-top:30px;">
<h3 class="page-title">{{$title}}</h3><br />

<form name="detail" method="post" action=""  enctype="multipart/form-data">
          
  <table id="doclist-table"  width="95%" cellpadding="0" cellspacing="0" style="border:1px solid #999;">
   <tr>  <th>Notes</th>  </tr>
   <tr>  <th>
    <input type="hidden" name="bsn_id" value="{{$bsn_id}}" />
   <textarea name="bsn_dair_notes" cols="180" rows="15">{{$bsn_dair_notes}}</textarea> 

   </th>  </tr>
   
    </table> 
  	<div style="padding-top:20px;">
        <input type="submit" name="add_notes" value="Save" />
        <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:parent.$.fancybox.close();" class="vsml" />
      </div>
      
    </form>  
  </div> 