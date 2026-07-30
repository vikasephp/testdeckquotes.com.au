<?php

$sql = "SELECT * from  template_docs_manoj";

$data = $fwDb->query($sql);
db("Testing");
foreach($data as $k=>$v)
{
	$sql_1 = "update  template_hub_docs_manoj set dhd_link_pdf = '".$v['dh_link_pdf']. "' where dhd_dh_id = ".$v['dh_uid'];
 	$data_1 = $fwDb->queryOne($sql_1);
	
	$sql_2 = "update  template_hub_docs_manoj set dhd_link_word = '".$v['dh_link_word']. "' where dhd_dh_id = ".$v['dh_uid'];
 	$data_2 = $fwDb->queryOne($sql_2);
}

exit;
	