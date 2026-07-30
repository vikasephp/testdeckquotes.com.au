<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tabview/tabcontent.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/tabview/tabcontent.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />


<div><br />
    <h3 class="page-title">Upload QR Code</h3>    
    <form name="sta" method="post" action="" enctype="multipart/form-data">
        <table cellpadding="5" cellspacing="0" width="90%" border="1" id="list-table">
            <tr>
                <th>QR Code</th>
                <td>
                    <input type="file" name="doc_qr_code" id="doc_qr_code">
                    {{if $detail.doc_qr_code}}
                    <div style="margin-top: 10px;">
                        <a href="/business.download_content?file_name={{$detail.doc_qr_code}}&module_name=business.home">{{$detail.doc_qr_code}}</a>
                        <button name="delete" value="delete" style="background: transparent; border: none; cursor: pointer;" onclick="return confirm('Are you sure want to delete?')" type="submit"><img src="https://www.deckquotes.com.au//images/delete_icon.png" width="20"></button>
                    </div>
                    {{/if}}
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="submit" name="save" value="Upload" />
                    <input type="button" value="Close" onclick='javascript:refresh_close();' />
                </td>
            </tr>
        </table>
    </form>
    {{if $msg }}
        <h2 style="text-align: center; font-size:24px;">{{$msg}} </h2>
    {{/if}}
</div>

<script type="text/javascript">
    function refresh_close() {
        parent.requestDocumentCheckList('add');
        parent.$.fancybox.close();
    }
</script>