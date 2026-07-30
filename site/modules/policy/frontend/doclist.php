<?php
$this_id = $fwRequest->getParamget($ID2, 0);

if($this_id > 0)
	{
$thisTable = new Fw_Db_Table($TABLE2);
$thisTable->setWhere($ID2." = $this_id");
	$docData = $thisTable->getRows();
	
		if($docData)
		{
			$data = '<table id="doc_list-table"><tr>';
			$count = 0;
			foreach($docData as $k => $v)
					{
					$dhd_id = $v[$ID1];
					$dhd_name = $v['bpd_name'];
					$dhd_shor_name = PHPTruncate($v['bpd_name'], 10);
					$iconpath = get_icon_path($v['bpd_type'], $v['bpd_name'], $Document_path);
					if($count % 5 == 0)
							{
							$data.='</tr><tr>';
							}
					$data.='<td width="50"><div align="center"><a href="#" title="'.$dhd_name.'"><img src="'.$iconpath.'" width="20"></a><br><a href="#" title="'.$dhd_name.'">'.$dhd_shor_name.'</a><a href="javascript:delete_docfile('.$dhd_id.');" title="Delete" ><img src="'.BASE_URL.'images/DeleteRed_new.gif"></a></div></td>';
					$count ++;	
					}
				$data.='</tr></table>';	
					
		}
	}
if(empty($data)){$data = '<table id="doc_list-table" width="100%"><tr><td><div align="center" style="color:#FF0000;">Document not found.</div></td></tr></table>';}
echo $data;
exit;