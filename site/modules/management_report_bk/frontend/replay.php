<?php
$fwMainView = 'file:' . getcwd() . '/replay.tpl';
$tablenotes = new Fw_Db_Table('mistake_log_notes');

$id = $fwRequest->getParam('ml_id', 0);

$fwViewData['id']= $id;
$fwViewData['user']= $_SESSION['user']['user_id'];
$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('notes', array());
    $this_id = (int)$detail[$ID];

    unset($detail[$ID]);
    $detail['mn_user'] = $_SESSION['user']['user_id'];

     if($_FILES['replydoc'])
		{
			$docfile_1 = $_FILES['replydoc']['name'];
			$file_type = $_FILES['replydoc']['type'];				
			
			$datetime = trim(date('d_m_Y_H_i_'),'0');
			$docfile_1 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
			$src = $_FILES['replydoc']['tmp_name'];
			$destination = BASE_DIR.'files/mistake_log/'.$docfile_1;
			
				if(!move_uploaded_file($src, $destination))
						{
							//echo "Possible file upload attack";
						}
				else
						{
							$detail['mn_doc'] = $docfile_1;
							chmod($destination, 0664);
						}						
	     }
   
		
	$opr = $tablenotes->insertRow($detail); 
		  	
	$fwViewData['opr'] = $opr;
		
}


$id = $fwRequest->getParam('ml_id', 0);

if($id > 0)
{

$sql = "SELECT mistake_log_notes.*, users.user_name from mistake_log_notes 
        inner join users on mistake_log_notes.mn_user =  users.user_id
	where mistake_log_notes.mn_log_id = ".$id;	

$fwViewData['notesData'] = $fwDb->query($sql);

$sql2 = "Select mistake_log.ml_mistake, mistake_log.ml_person_created , mistake_log.ml_date from mistake_log 
       
	where mistake_log.ml_id = ".$id;
	
$fwViewData['mistake'] = $fwDb->queryOne($sql2);

}