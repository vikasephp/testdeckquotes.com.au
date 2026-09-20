<?php 
$fwMainView = 'file:' . getcwd() . '/videolinks_detail.tpl';
$tableVideoLinks = new Fw_Db_Table('video_links');

$submit = $fwRequest->getParam('subAddDetail', '');
$bsn_id = $fwRequest->getParam('bsn_id', '');
$fwViewData['bsn_id'] = $bsn_id;

if(empty($bsn_id))
{
$bsn_id = $fwRequest->getParam('bsns_id', '');
}

if(empty($bsn_id))
{
if($buse_id){$bsn_id = $buse_id;}
}


$fwViewData['bsn_id'] = $bsn_id;


if($submit)
{
 $detail = $fwRequest->getParam('video', array());	

	$table_id =  (int)$detail['vl_id'];
	
	unset($detail['be_id']);

						if($table_id > 0)
							{
								$tableVideoLinks->setWhere("vl_id=".$table_id);
								$table_id= $tableVideoLinks->updateRow($detail);
							}
						else
							{			
										
								$table_id=$tableVideoLinks->insertRow($detail);
							}
$fwViewData['msg'] = $table_id;
}