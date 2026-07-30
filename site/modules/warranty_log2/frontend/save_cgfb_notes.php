<?php
if (isset($_POST['notes']['wa_cgfb_notes'])) {
	$wa_id = intval($_POST['notes']['wa_id']);
    $wa_cgfb_notes = trim($_POST['notes']['wa_cgfb_notes']);

    $sqlcgfb = "UPDATE warranty_log SET wa_cgfb_notes = '".$wa_cgfb_notes."' WHERE wa_id = ".$wa_id;
	$dataT = $fwDb->queryOne($sqlcgfb);

    exit;
}
