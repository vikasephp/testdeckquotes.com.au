<?php
$thisTable = new Fw_Db_Table('merge_report_buttons');
$submit = $fwRequest->getparam('subAddDetail', '');


if(!empty($submit))
{
   $detail = $fwRequest->getparam('button', '');

   
	 $id = (int)$detail['mr_id'];
     unset($detail['mr_id']);
		 if($id > 0)
			{
				$thisTable->setWhere("mr_id = $id");
				$thisTable->updateRow($detail);
			}
			else
			{	
			 $id2 = $thisTable->insertRow($detail);   
			
			 $field_name = 'admin_button_'.$id2;	
			 $queryfield = "ALTER TABLE admin_document_check_list ADD " .$field_name.  " INT( 2 ) NOT NULL ";

			 $det = $fwDb->execute($queryfield);
	       
			}
	Location(BASE_URL. $XFA['listbuttons']);
}
$fwViewData['title'] = "Add Quick Button";
$fwViewData['button'] = "Add";
$id = (int)$fwRequest->getParam('mr_id', 0);
if($id > 0)
{
    $thisTable->setWhere("mr_id = $id");
	$fwViewData['detail'] = $thisTable->getRow();
    $fwViewData['title']= "Edit Quick Button";
	$fwViewData['button'] = "Edit";
}

