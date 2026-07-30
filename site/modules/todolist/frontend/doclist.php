<?php
$dhd_dh_id = $fwRequest->getParamget('dhd_dh_id', 0);
if($dhd_dh_id > 0)
	{
$thisTable = new Fw_Db_Table('business_to_do_list_docs');
$thisTable->setWhere("btdl_list_id = $dhd_dh_id");
	$docData = $thisTable->getRows();
	
		if($docData)
		{
			$data = '<table id="doc_list-table"><tr>';
			$count = 0;
			foreach($docData as $k => $v)
					{
					$dhd_id = $v['btdl_docs_id'];
					$dhd_name = $v['btdl_docs_name'];
					$dhd_shor_name = PHPTruncate($v['btdl_docs_name'], 10);
					$iconpath = get_icon_path($v['btdl_docs_type'], $v['btdl_docs_name']);
					if($count % 5 == 0)
							{
							$data.='</tr><tr>';
							
							}
					$data.='<td width="50"><div align="center"><a href="#" title="'.$dhd_name.'"><img src="'.$iconpath.'" width="40"></a><br><a href="#" title="'.$dhd_name.'">'.$dhd_shor_name.'</a><a href="javascript:delete_docfile('.$dhd_id.');" title="Delete" ><img src="'.BASE_URL.'images/DeleteRed_new.gif"></a></div></td>';
					$count ++;	
					}
				$data.='</tr></table>';	
					
		}
	}
if(empty($data)){$data = '<table id="doc_list-table" width="100%"><tr><td><div align="center"><h3>Files not found.</h3></div></td></tr></table>';}
echo $data;
exit;