<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<base href="{{$BASE_URL}}" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tabview/tabcontent.css" />
<title>.:: {{$SITE_NAME}} - {{$title}} ::.</title>
<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>


<!--</script>
   {{if $msg != 0}}  
   <script type="text/javascript">
	//parent.requestbusenquiryInfo(1);
   </script>   
{{/if}}-->
   {{if $msg != 0}}  
   <script type="text/javascript">
	parent.requestOthercontactDiv(1);
   </script>
   <script type="text/javascript">
   window.setTimeout('window.parent.add_edit_othercontact()', 500);
   </script>   
       
{{/if}}
</head>
<!--<body bgcolor="#FFFFFF" onClick = closediv();>-->
<body bgcolor="#FFFFFF">
<table width="100%" id="none-table" style="background-color:#FFFFFF;" >
<form name="detail" method="post" action="">
<tr><td colspan="10" height="30">&nbsp;</td></tr>
<tr><td colspan="2"><table width="100%" border="0" style="background-color:#FFFFFF;" >
<tr><td width="150">Contact Type:</td><th colspan="8">
<input type="hidden" name="{{$TABLE}}[oc_id]" value="{{$detail.oc_id}}" />  
<input type="hidden" name="{{$TABLE}}[oc_cust_id]" value="{{$detail.oc_cust_id}}" id="dt_id" />  
<input type="hidden" name="{{$TABLE}}[oc_bsn_id]" value="{{$bsn_id}}" />

<select name="{{$TABLE}}[oc_contact_type]" style="width:220px;">
{{foreach from=$contact_types item='item' key='key'}}
	<option value="{{$item.ct_id}}" {{if $detail.oc_contact_type == $item.ct_id}} selected="selected" {{/if}}>{{$item.ct_name}}</option>
{{/foreach}}
</select>
</th></tr>

<tr><td>First Name:</td>
<th ><input type="text" style="width:200px;"  name="{{$TABLE}}[oc_fname]" value="{{$detail.oc_fname}}" /></th>
<td>Co./Last </td>
<th ><input type="text" style="width:200px;" name="{{$TABLE}}[oc_lname]" value="{{$detail.oc_lname}}"/></th>
<td></td><th></th>
</tr>
<tr><td>Email:</td>
<th ><input type="text" style="width:200px;"  name="{{$TABLE}}[oc_email]" value="{{$detail.oc_email}}" /></th>
<td>Mobile: </td>
<th ><input type="text" style="width:200px;" name="{{$TABLE}}[oc_mobile]" value="{{$detail.oc_mobile}}"/></th>
<td>Business:</td><th> <input type="text" style="width:200px;" name="{{$TABLE}}[oc_business]" value="{{$detail.oc_business}}"/></th>
</tr> 
 <tr><td>Comment:</td>
<th colspan="6"><textarea cols="170" rows="10" name="{{$TABLE}}[oc_comment]">{{$detail.oc_comment}}</textarea></th>
<th></th>
</tr>
 <tr><td colspan="8"><div align="left"><input type="submit" name="subAddDetail" value="{{$button}}" class="sml"/>&nbsp;<input type="button" name="cancel" value="Cancel" onclick="parent.add_edit_othercontact();" class="sml"/></div></td></tr>
        </form>
      </table>
<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("detail");
    frmvalidator.EnableMsgsTogether();
    frmvalidator.addValidation("{{$TABLE}}[oc_fname]","req", "Please specify First Name.");
	frmvalidator.addValidation("{{$TABLE}}[oc_lname]","req", "Please specify Last Name.");
	frmvalidator.addValidation("{{$TABLE}}[oc_email]","req", "Please specify Email.");
	frmvalidator.addValidation("{{$TABLE}}[oc_email]","email", "Please specify valid Email.");
</script>
</body>