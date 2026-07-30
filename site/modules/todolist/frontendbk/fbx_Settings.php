<?php
/*
<fusedoc fuse="fbx_Settings.php">
	<responsibilities>
		I set up the enviroment settings for this circuit. If this settings file is being inherited, then you can set a variable outright to override a value set in a parent circuit or use if(!isset(...)) to accept a value set by a parent circuit
	</responsibilities>
</fusedoc>
*/
require_once(MODULES_DIR . 'frontend.init.php');
$fwAuthGroup->forceLogin();
// module names
$MODULE_SINGULAR = 'Projects To Do List';
$MODULE_PLURAL = 'Documents';
$fwViewData['MODULE_SINGULAR'] = $MODULE_SINGULAR;
$fwViewData['MODULE_PLURAL'] = $MODULE_PLURAL;

// module table and id
$TABLE = 'business_to_do_list';
$ID = 'btdl_id';
$fwViewData['TABLE'] = $TABLE;
$fwViewData['ID'] = $ID;

// fuseactions
$XFA['list'] = $Fusebox['circuit'] . '.list';
$XFA['detail'] = $Fusebox['circuit'] . '.detail';
$XFA['delete'] = $Fusebox['circuit'] . '.delete';
$XFA['home'] = $Fusebox['circuit'] . '.home';
$XFA['upload'] = $Fusebox['circuit'] . '.upload';
$XFA['docdelete'] = $Fusebox['circuit'] . '.docdelete';
$XFA['view'] = $Fusebox['circuit'] . '.view';
$XFA['archives'] = $Fusebox['circuit'] . '.archives';

function get_icon_path($type, $name)	
		{
			$pdfarray = array("application/pdf");
			$wordarray = array("application/vnd.openxmlformats-officedocument.wordprocessingml.document","application/msword");
			$excelarray = array("application/vnd.ms-excel");
			$imagearray = array("image/png","image/jpg","image/jpeg","image/gif");
			
			
			if(in_array($type, $pdfarray))
				{
				$iconpath = BASE_URL."images/pdf.png";
				}
			elseif(in_array($type, $wordarray))
				{
				$iconpath = BASE_URL."images/word.png";
				}
			elseif(in_array($type, $excelarray))
				{
				$iconpath = BASE_URL."images/excel.png";
				}
			elseif(in_array($type, $imagearray))
				{
				$iconpath = BASE_URL.FILE_PATH."files/business_todo_documents/".$name;
				}	
			else
				{
				$iconpath = BASE_URL."images/attachment.png";
				}	
return $iconpath;
		
		}