<?php
$sd_id = (int)$fwRequest->getparamget('sd_id', 0);
if ($sd_id > 0)
{
   $sql = "update sales_document_explained set sd_link='' where sd_id = ".$sd_id;
   $fwDb->queryOne($sql);
}
Location(BASE_URL . 'sales_document_explained.home');
exit;