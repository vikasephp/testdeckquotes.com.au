<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/w3.css" />
{{include file=$jdata}}
{{include file=$tiny_basic}}

<style>
    ul {
        list-style: disc !important;
        text-align: left !important;
    }

    #fancybox-wrap {
        z-index: 9999999;
    }
</style>

<script>
    var isChecked = true;
    function checkAll() {


        var checkboxes = document.getElementsByClassName('cls');
        if (isChecked) {
            for (var i = 0; i < checkboxes.length; i++) {
                if (checkboxes[i].type == 'checkbox') {
                    checkboxes[i].checked = true;
                }
            }
        } else {
            for (var i = 0; i < checkboxes.length; i++) {
                console.log(i)
                if (checkboxes[i].type == 'checkbox') {
                    checkboxes[i].checked = false;
                }
            }
        }
        isChecked = !isChecked;
    }
</script>

<script language="javascript">
    function add_procedure() {
        var viewurl = "{{$BASE_URL}}brief_builder.view_procedure" + "/random/" + Math.random();

        $(document).ready(function () {

            $.fancybox({

                'width': '90%',
                'height': '99%',
                'autoScale': false,
                'transitionIn': 'elastic',
                'transitionOut': 'elastic',
                'speedIn': 300,
                'speedOut': 300,
                'overlayShow': true,
                'overlayColor': '#000',
                'hideOnOverlayClick': false,
                'hideOnContentClick': false,
                'type': 'iframe',
                'href': viewurl,
                'scrolling': 'yes'
            });
        });
    }
</script>



<table width="90%">
    <tr>
        <td width="33%" style="text-align:left;">
            <input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" />
            <input type="button" name="Add New" value="Add New Catergory"
                onclick="javascript:add_new('{{$BASE_URL}}brief_builder.catergory');" /> &nbsp;
            <input Type="button" value="Add Word Document" />
            <input type="button" name="edit_cat" value="Edit Catergory"
                onclick="javascript:add_new('{{$BASE_URL}}brief_builder.edit_catergory');" />
        </td>
        <td width="33%">
            <h3 class="page-title">{{$title}}</h3>
        </td>
        <td width="33%"> </td>

</table>

<table width="100%">
    <tr>
        <td>
            <form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
                <div style="float:right;">
                    <input type="button" name="Add New " value="Add New"
                        onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.detail}}');" />
                </div>
            </form>
        </td>
    </tr>
</table>

<div>
    <form name="style" method="post" action="">
        <select name="cat">
            {{foreach from=$catData key="keyc" item="itemc"}}
            <option value="{{$itemc.bbc_id}}" {{if $itemc.bbc_id eq $cat }} selected="selected" {{/if}}>
                {{$itemc.bbc_text}}</option>
            {{/foreach}}
        </select>
        <input type="submit" name="search" value="Search" />
        <input type="submit" name="showall" value="Show All" />
        <button type="button" class="checkall" onClick="checkAll()">Check All</button>
        <input type="submit" name="wdoc" value="Generate Word Document" /><br />
        <table id="list-table" class="nav-back" width="100%">

            <tbody id="myTable" style="font-family:Calibri;">
                <tr>

                    {{assign var="ctr" value=1}}
                    {{foreach from=$imagelist key="key" item="item"}}

                    <td style="text-align:center; width:20%; vertical-align:top;">
                        <strong>{{$item.bb_label}}</strong> <br /><br />


                        <img src="https://deckquote.s3.amazonaws.com/files/brief_builder/{{$item.bb_image}}"
                            data-img-name="{{$item.bb_image}}" data-img-id="{{$item.bb_id}}"
                            style="height:140px; width:150px;cursor:pointer;" onclick="onClick(this)"
                            class="w3-hover-opacity" />
                        <br /><br />

                        <div
                            style="height:90px; overflow:scroll; overflow-x:hidden; border:1px solid #09F; font-family:Calibri;">
                            {{$item.bb_text}}</div><br />
                        <div style="text-align:left;"><strong>Link to MS teams :</strong>
                            {{if $item.bb_link_msteam}} <a href="{{$item.bb_link_msteam}}" target="_blank">Link</a>
                            {{/if}}
                        </div>
                        <div style="text-align:left;"><strong>Link to Website :</strong>
                            {{if $item.bb_link_website}}<a href="{{$item.bb_link_website}}" target="_blank">Link</a>
                            {{/if}}
                        </div>
                        <div style="text-align:left;"><strong>Reference Source :</strong> {{$item.bb_ref_source}}</div>
                        <div style="text-align:left;"><strong>Catergory :</strong> {{$item.bbc_text}}</div>
                        <br />

                        <input type="checkbox" name="brief[{{$item.bb_id}}]" class="cls" /> &nbsp; &nbsp;
                        <a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" class="various" title="Edit">
                            <img style="height:20px; width:20px;"
                                src="{{$BASE_URL}}css/admin/images/edit.png" /></a>&nbsp;&nbsp;
                        <a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}"
                            onclick="javascript:if(!confirm('Are you sure want to delete the image?')) return false;"
                            title="Delete">
                            <img style="height: 16px;; width:16px"
                                src="{{$BASE_URL}}css/admin/images/deletecross.png" /></a>

                        {{if $ctr % 5 eq 0}}
                </tr>
                <tr>
                    {{/if}}
                    {{assign var="ctr" value=$ctr+1}}
                    {{/foreach}}

                </tr>
            </tbody>
        </table>

    </form>
</div>

<div id="modal01" class="w3-modal" onclick="this.style.display='none'">
    <span class="w3-button w3-hover-red w3-xlarge w3-display-topright">&times;</span>
    <div class="w3-modal-content w3-animate-zoom">
        <img id="img01" style="width:100%;">
    </div>
</div>

<script>
    function onClick(element) {
        document.getElementById("img01").src = element.src;
        document.getElementById("modal01").style.display = "block";
    }

    function get_img_raw_data(myKeyVals) {
        $.ajax({
            type: 'POST',
            url: '/brief_builder.get_image_raw_data',
            data: myKeyVals,
            dataType: "json",
            success: function (resultData) {
                if (resultData.status == 'true') {
                    var img_raw_data = resultData.data.rawImgData;
                    var file_name = resultData.data.fileName;
                    var file_id = resultData.data.id;
                    $('#list-table img[data-img-id="' + file_id + '"]').attr("src", img_raw_data);
                }
            }
        });
    }

    $(document).ready(function () {
        $("#list-table tr img.w3-hover-opacity").each(function () {
            var file_name = $.trim($(this).attr("data-img-name"))
            var id = $.trim($(this).attr("data-img-id"));
            var myKeyVals = { "file_name": file_name, "id": id };
            get_img_raw_data(myKeyVals);
        })
    })
</script>