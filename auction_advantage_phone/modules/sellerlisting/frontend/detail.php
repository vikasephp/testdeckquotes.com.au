<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableBusiness = new Fw_Db_Table($TABLE);
$tableSource = new Fw_Db_Table('enquirysource');
$tablestatus = new Fw_Db_Table('busness_status');
$tablenotes = new Fw_Db_Table('mbsl_notes');
$mlbs_id = $fwRequest->getParam($ID, '');
$mbsl_id = $fwRequest->getParam('mbsl_id', '');
$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('seller_listing', array());
	$detail['mlbs_update_date'] = changedate_y_m_d($detail['mlbs_update_date']);
	$this_id=$detail['mlbs_id'];
	unset($detail['mlbs_id']);
	unset($detail['mlbs_business_name']);
						
						$notesdata['mbsl_notes'] = trim($detail['mlbs_notes']);
						$notesdata['mbsl_date'] = date('Y-m-d');

			if($this_id)
			{
						$tableBusiness->setWhere("mlbs_id = ".$this_id);
						$tableBusiness->updateRow($detail);		
						$fwViewData['opr'] = "Success!";
						
						$notesdata['mbsl_lfi_id'] = $this_id;
			 if($notesdata['mbsl_notes'])
			 	{			
					if($detail['mbsl_id'])		
							{
							$tablenotes->setWhere("mbsl_id = ".$detail['mbsl_id']);	
							$tablenotes->updateRow($notesdata);
					}else{	
						$tablenotes->insertRow($notesdata);
						}
				}		
							
			}
			else
			{
			 $tableBusiness->insertRow($detail);          			
			}	
			
			
			
			
			
							
			if(!$fwViewData['msg'])
				{
					$fwViewData['opr'] = " Data Successfully updated!";
				}

				
}	

if ($mlbs_id > 0)
	{
		$sql1 = "Select ".$TABLE.".*, business.bsn_id, business.bsn_name, business.bsn_status from ".$TABLE."
				 Left Join business on ".$TABLE.".mlbs_business_id = business.bsn_id where ".$TABLE.".mlbs_id = ". $mlbs_id;
		$fwViewData['detail'] = $fwDb->queryOne($sql1);			 

	
	if($mbsl_id)
		{
		$tablenotes->setWhere("mbsl_id = ".$mbsl_id);
		$fwViewData['notesdata'] = $tablenotes->getRow();
		//DB($fwViewData['notesdata']);
		}
	
		$fwViewData['title'] = 'Edit Master Business Listing';
	}
else
	{
		$fwViewData['title'] = 'Add Master Business Listing';
	}

	
	$fwViewData['status']  = $tablestatus->getRows();

	
	$source = $tableSource->getRows();
	$fwViewData['source'] = $source;
	
	if($mlbs_id > 0)
	{
	$tablenotes->setWhere("mbsl_lfi_id = ".$mlbs_id);
	$fwViewData['blnotes'] = $tablenotes->getRows();
	}
	