<?php 
$request = $fwRequest->getParamget('request', '');
if($request)
	{
switch($request)
		{
		
		case 'setdefault':
		
		$dhd_dh_id = $fwRequest->getParamget('dhd_dh_id', 0);
		$mid = $fwRequest->getParamget('id', 0);
			if($dhd_dh_id > 0)
				{
			$thisTable = new Fw_Db_Table('cma_images');
			$thisTable->setWhere("cma_id = $dhd_dh_id");
			$data['cma_default'] =0;
			$thisTable->updateRow($data);
			
			$thisTable->setWhere("cm_id = $mid");
			$data['cma_default'] =1;
			$thisTable->updateRow($data);
				}
		break;
	}	
}
echo "done";
exit;
?>