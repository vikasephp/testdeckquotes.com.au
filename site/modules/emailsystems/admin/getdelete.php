<?php  
$fwMainView = 'file:' . getcwd() . '/getdelete.tpl';
$thisTable = new Fw_Db_Table($TABLE);
$opr = $fwRequest->getparamget('a_req', '');
	if($opr)
		{
			switch($opr) 
				{
				case 'delatt':
				$et_id = $fwRequest->getparamget('et_id', 0);	
				$key_id = $fwRequest->getparamget('id', '');
				
    			$thisTable->setWhere("$ID = $et_id");
				$data = $thisTable->getRow();
				$newdata = "";		
				$tempatta = unserialize($data['et_attachment']); 
				if($tempatta)
					{		
					foreach($tempatta as $k => $v)	
							{
							if($k != $key_id)
								{
								$newdata[] = $v;
								}
							
							}
					if($newdata){
					$newdata['et_attachment'] = serialize($newdata);
					}else{$newdata['et_attachment'] ='';}	
					$id = $thisTable->updateRow($newdata);
					}		
								
					break;
				case 'list':
					$et_id = $fwRequest->getparamget('et_id', 0);
					
					$thisTable->setWhere("$ID = $et_id");
						$data = $thisTable->getRow();
						$newdata = "";		
						$fwViewData['et_attachments'] = unserialize($data['et_attachment']); 
				
				}
		
		
		}
