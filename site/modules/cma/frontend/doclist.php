<?php
$dhd_dh_id = $fwRequest->getParamget('dhd_dh_id', 0);
if($dhd_dh_id > 0)
	{
$thisTable = new Fw_Db_Table('cma_images');
$thisTable->setWhere("cma_id = $dhd_dh_id");
	$docData = $thisTable->getRows();
	
		if($docData)
		{
			$data = '<table id="doc_list-table"><tr>';
			$count = 0;
			foreach($docData as $k => $v)
					{
					$dhd_id = $v['cm_id'];
					$dhd_name = $v['cma_name'];
					$default =$v['cma_default'];
					$status="";
					if($default == 1){ $status =  'checked="checked"';}
					
					
					$dhd_shor_name = PHPTruncate($v['cma_name'], 10);
					$iconpath = BASE_URL.FILE_PATH."files/cma/". $v['cma_name'];
					if($count % 5 == 0)
							{
							$data.='</tr><tr>';
							}
			$data.='<td width="50"><div align="center"><input type="radio" value="1" onClick="set_default('.$dhd_id.', '.$dhd_dh_id.');" '.$status.'><a href="#" title="'.$dhd_name.'"><img src="'.$iconpath.'" width="40"></a><br><a href="#" title="'.$dhd_name.'">'.$dhd_shor_name.'</a><a href="javascript:delete_docfile('.$dhd_id.');" title="Delete" ><img src="'.BASE_URL.'images/DeleteRed_new.gif"></a></div></td>';
					$count ++;	
					}
				$data.='</tr></table>';	
		}
	}
if(empty($data)){$data = '<table id="doc_list-table" width="100%"><tr><td><div align="center"><h3>Files not found.</h3></div></td></tr></table>';}
echo $data;
exit;