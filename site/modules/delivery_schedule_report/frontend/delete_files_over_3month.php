<?php

    
    $next_due_date = date('Y-m-d H:i:s'); // 2024-01-17 19:07:36
	$sql_st = "SELECT * FROM `delivery_schedule_report_3m` WHERE created_at < '".$next_due_date."'";
	$detail = $fwDb->query($sql_st);
	
	if( !empty($detail) )
	{
	    foreach ($detail as $key => $value) {
        	$file_name = $value['file_name'];$file_id = $value['id'];
        	$filePath = $_SERVER['DOCUMENT_ROOT'].'/email_links/3/months/files/'.$file_name ;
        	if(file_exists($filePath)){
               if( unlink($filePath) )
               {
                  $thisTable = new Fw_Db_Table("delivery_schedule_report_3m");
                  $thisTable->setWhere("id = '".$file_id."'"); $thisTable->deleteRow();
               }
            }
        }
	}

exit();
?>