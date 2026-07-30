	<script type="text/javascript" src="{{$BASE_URL}}js/ckeditor/ckeditor.js"></script>
	<script src="{{$BASE_URL}}js/ckeditor/_samples/sample.js" type="text/javascript"></script>
	<link href="{{$BASE_URL}}js/ckeditor/_samples/sample.css" rel="stylesheet" type="text/css" />

<div id="content">
	<div class="post">
    <h3 class="page-title">{{$title}}</h3>
    
    <!----><form name="detail" method="post" action="{{$XFA.detail}}">
    <form name="detail" method="post" action="{{$BASE_URL}}profile.detail}}">
        <table id="product-table" width="99%" border="0">
           <input type="hidden" name="profile[profile_id]" value="{{$detail.profile_id}}" />
          
            <tr>
                <th width="30%" align="right">Business Name :</th>
                <td><input type= "text" name="profile[business_name]" value="{{$detail.business_name}}" class="vlrg" /></td>
            </tr>
              <tr>
                <th align="right">Email : </th>
                <td><input type= "text" name="profile[email]" value="{{$detail.email}}" class="vlrg" /></td>
            </tr>
            <tr>
                <th align="right" >Contact Number :</th>
                <td><input type= "text" name="profile[contact_number]" value="{{$detail.contact_number}}" class="vlrg" /></td>
            </tr>
            <tr>
                <th align="right">Address :</th>
                <td><textarea name="profile[address]" style="height:60px;" class="vlrg" id="xyz" >{{$detail.address}}</textarea></td>
            </tr>
           
            <tr>
                <th align="right"> City :</th>
                <td width="500px"><input type= "text" name="profile[city]" value="{{$detail.city}}" class="vlrg" /> </td>
            </tr>
           
         <tr>
                <th align="right"> State :</th>
                <td width="500px"><input type= "text" name="profile[state]" value="{{$detail.state}}" class="vlrg" /> </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center;">
                    <input type="submit" name="subAddDetail" value="Save" class="vsml" />
                    <input type="button" name="btnCancelDetail" value="Cancel" onclick="history.go(-1);" class="vsml" />
                </td>
            </tr>
        </table>
    </form>

</div>
</div>
<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("detail");
    frmvalidator.EnableMsgsTogether();
    frmvalidator.addValidation("profile[page_title]","req", "Please specify Title");
</script>