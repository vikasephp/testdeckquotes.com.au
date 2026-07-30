<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />


<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

<style>
.tabl {font-size:12px;}
.tbl td {font-size:12px;}
/*input[type="submit"], input[type="button"], input[type="reset"] {*/
 .butt {
   
    height: 100px;
    
    width: 100px;
    background: url(images/green.png) top repeat-x;
  
    color: #0C0;
    line-height: 25px;
    text-decoration: none;
    text-transform: uppercase;
    padding: 0 10px;
    behavior: url(images/PIE.htc);
    position: relative;
    cursor: pointer;
  
}
</style>

 
{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<div align="center" style="min-height:350px;"><br />
    <h3 class="page-title">Comment</h3>    
<br />

<form name="detail" method="post" action=""  enctype="multipart/form-data">
<table id="list-table" cellpadding="5" >
    <input type="hidden" name="bsn_id" value="{{$bsn_id}}" />
 
     <tr>
      <th>
      <textarea name="textmsg" rows="25" cols="180">{{$whatdata}}</textarea>
      </th>
         
    </tr> 
  
</table>
<br />
<input type="submit" name="submit" value="Save" >
<input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
</form>
    
    <script type="text/javascript">
		function closepop()
		{
		parent.$.fancybox.close();
		setTimeout('parent.close_win();', 500);
		}
	</script>
    
	
</div>

<script>
	initSample();
</script>