<?php
$fwMainView = 'file:' . getcwd() . '/replay.tpl';
$tablenotes = new Fw_Db_Table('warranty_log_notes');

$id = $fwRequest->getParam('wa_id', 0);

$fwViewData['id']= $id;
$fwViewData['user']= $_SESSION['user']['user_id'];
$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('notes', array());
    $this_id = (int)$detail[$ID];

    unset($detail[$ID]);
    $detail['wn_user'] = $_SESSION['user']['user_id'];

     if($_FILES['replydoc'])
		{
			$docfile_1 = $_FILES['replydoc']['name'];
			$file_type = $_FILES['replydoc']['type'];				
			
			$datetime = trim(date('d_m_Y_H_i_'),'0');
			$docfile_1 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
			$src = $_FILES['replydoc']['tmp_name'];
			$destination = BASE_DIR.'files/warranty_log/'.$docfile_1;
			
				if(!move_uploaded_file($src, $destination))
						{
							//echo "Possible file upload attack";
						}
				else
						{
							$detail['wn_doc'] = $docfile_1;
							chmod($destination, 0664);
						}						
	     }
   
		
	$opr = $tablenotes->insertRow($detail); 
		  	
	$fwViewData['opr'] = $opr;
		
}


$id = $fwRequest->getParam('wa_id', 0);

if($id > 0)
{

$sql = "SELECT warranty_log_notes.*, users.user_name from warranty_log_notes 
        inner join users on warranty_log_notes.wn_user =  users.user_id
	where warranty_log_notes.wn_log_id = ".$id;	


$fwViewData['notesData'] = $fwDb->query($sql);


}