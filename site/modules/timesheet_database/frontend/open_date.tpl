<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />

<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

{{if $opr}}
<script type="text/javascript">

setTimeout('parent.close_win();', 500);
//location.reload();
</script>
{{/if}}


<div align="center" style="padding-top:30px;">
<h3 class="page-title">{{$title}}</h3><br />

<form name="detail" method="post" action=""  enctype="multipart/form-data">
          
  <table id="doclist-table"  width="95%" cellpadding="0" cellspacing="0" style="border:1px solid #999;">
   <tr> 
      <th>Select Open Date </th>  
      <td><input type="text" name="open_date"  class="w16em dateformat-d-ds-m-ds-Y dtpic" /></td>
   </tr>
   
   
    </table> 
  	<div style="padding-top:20px;">
        <input type="submit" name="add_date" value="Save" />
        <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:parent.$.fancybox.close();" class="vsml" />
      </div>
      
    </form>  
  </div> 