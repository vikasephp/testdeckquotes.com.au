<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$table = new Fw_Db_Table('report_table');
$tableImage = new Fw_Db_Table('report_rule_images');
$tableLink =  new Fw_Db_Table('report_rule_links');
$tableRule = new Fw_Db_Table('report_rule');
$mr_id = $fwRequest->getParam('mr_id', '');
$fwViewData['mr_id'] = $mr_id;
 
 
$qa = $fwRequest->getParam('qa', '');
if($qa)
{
	 $keys_2 = array_keys($qa);
	 $ky_2 = $keys_2[0];
	 $val_2 = $qa[$ky_2];
	
	  $detail['rr_qa'] = $val_2;
	  $detail['rr_qa_user'] = $_SESSION['user']['user_name'];
	  $detail['rr_qa_date'] = date('d-m-Y');
	  
	  $tableRule->setWhere("rr_id = ".$ky_2);
	  if($tableRule->rowExists())
	  {
		 $this_id = $tableRule->updateRow($detail);
	  }	  	
}


$hide = $fwRequest->getParam('hide', '');
if($hide)
{
	 $keys_1 = array_keys($hide);
	 $ky_1 = $keys_1[0];
	 $val_1 = $hide[$ky_1];
	
	  $detail_2['rr_hide'] = $val_1;
  
	  $tableRule->setWhere("rr_id = ".$ky_1);
	  if($tableRule->rowExists())
	  {
		 $this_id = $tableRule->updateRow($detail_2);
	  }	  	
}
 
 
$submit = $fwRequest->getParam('upload', ''); 
if(!empty($submit))
{
    $rr_id = $fwRequest->getParam('rr_id', 0);
  
	if($_FILES['newimg']['name'])
		{
			   
			    $docfile = $_FILES['newimg']['name'];
		
				$datetime = trim(date('d_m_Y_H_i_'),'0');
				$docfile = preg_replace('/[^A-Z0-9._]/i', '_', $docfile);
				$src = $_FILES['newimg']['tmp_name'];	
				upload($docfile, $src);
				$detail['ri_rr_id']= $rr_id;
				$detail['ri_image']= $docfile;
									

																		
		}
			
    $opr = $tableImage->insertRow($detail); 
    
	$fwViewData['opr'] = $opr;					
}  
 
 
$save = $fwRequest->getParam('save', ''); 
if(!empty($save))
{
    $rr_id = $fwRequest->getParam('rr_id', 0);
    $link = $fwRequest->getParam('newlink', '');
			    
	$detail2['rl_rr_id']= $rr_id;
	$detail2['rl_link']= $link;
		
    $opr = $tableLink->insertRow($detail2); 
    
	$fwViewData['opr'] = $opr;					
}  
   
  
$where = " Where rr_hide = 0 "; 

$showall = $fwRequest->getParam('showall', ''); 

if(!empty($showall)) {
	$where = " Where 1 = 1 "; 
}
 
 $keyword = $fwRequest->getParam('keyword', ''); 
 
  $clear = $fwRequest->getParam('clearall', ''); 
  if(!empty($clear)) {
    $fwViewData['keyword']='';
	unset($keyword);
	unset($_SESSION['keyword']);	 
 }
  
 if($keyword):
    $where .= " AND report_rule.rr_text LIKE '%".$keyword."%' OR 
	                report_rule.rr_question LIKE '%".$keyword."%' OR 
                    report_rule.rr_answer LIKE '%".$keyword."%' ";
	
	$_SESSION['keyword'] = $keyword;
	$fwViewData['keyword']=$_SESSION['keyword'];

 elseif($_SESSION['keyword'] && $pagenum > 0):

	$where .= " AND report_rule.rr_text LIKE '%".$_SESSION['keyword']."%' OR 
					report_rule.co_company_name LIKE '%".$_SESSION['keyword']."%' OR
	                report_rule.rr_answer LIKE '%".$_SESSION['keyword']."%'  ";	
	
	$fwViewData['keyword']=$_SESSION['keyword'];
 endif; 
  

$matsql = "SELECT * from report_rule ".$where;	

if($matsql){$userData = $fwDb->query($matsql);}

$fwViewData['total'] = sizeof($userData);

if(!empty($userData))
{
if (!(isset($pagenum))){ $pagenum = 1; } 
    $rows = count($userData);
    $page_rows = 100;
    $last = ceil($rows/$page_rows);    
    if ($pagenum <= 1)
    {
        $pagenum = 1;
    }
    elseif ($pagenum > $last)
    {
        $pagenum = $last;
    }
    $fwViewData['last'] = $last;
    $fwViewData['lastone'] = $last-1;
	$fwViewData['lasttow'] = $last-2;
    $fwViewData['pagenum'] = $pagenum;
	$pagenatedatanext = $pagenum;
	$pagenatedataprev = $pagenum;
	for($i=0; $i<9; $i++)
		{
		$paginate[$pagenatedatanext] = $pagenatedatanext;
		$pagenatedatanext ++;
		}
		$fwViewData['paginatenext'] = $paginate;
	$pagenatedataprev = $pagenum;	
	for($i=0; $i<9; $i++)
		{
		$paginateprev[$pagenatedataprev] = $pagenatedataprev;
		$pagenatedataprev --;
		}
	$fwViewData['paginateprev'] = array_reverse($paginateprev);
	
    $max = 'limit ' .($pagenum - 1) * $page_rows .',' .$page_rows;
    
    $sql2 =  $matsql." ".$max;
    if($sql2){$lists= $fwDb->query($sql2);

	foreach($lists as $list):

		$listsnew[] = $list;
	endforeach;
	
	//$fwViewData['list'] = $listsnew;
  }
}


foreach($listsnew as $k1=>$v1)
{
	$sql4 = "select rb_report_name from report_build where rb_id = ".$v1['rt_report_type'];
	$data4 = $fwDb->queryOne($sql4);
	
	$sqlimg = "select ri_id, ri_image from report_rule_images where ri_rr_id = ".$v1['rr_id'];
    $dataimg = $fwDb->query($sqlimg);
	
	$sqllink = "select rl_id, rl_link from report_rule_links where rl_rr_id = ".$v1['rr_id'];
    $datalink = $fwDb->query($sqllink);
	
	$listsnew[$k1]['image_data'] = $dataimg;
	$listsnew[$k1]['link_data'] = $datalink;	
}


$fwViewData['list'] = $listsnew;
$fwViewData['title'] = $MODULE_PLURAL;

$printpdf = $fwRequest->getParam('printpdf', '');
if(!empty($printpdf)){
	
	$html = '<html><body>';
	$last_key = end(array_keys($listsnew));
	foreach($listsnew as $k=>$v)
	{
		
		$html .= '<table border="1" cellpadding="5">';
		
		$html .= '<tr><td> Text : '.$v["rr_text"]. '</td></tr>';
		$html .= '<tr><td> Question : '.$v["rr_question"]. '</td></tr>';
		$html .= '<tr><td> Answer : '.$v["rr_answer"]. '</td></tr>';
		
		 //if(!empty($v['image_data'])) 
//		 {	
//			$html .= '<tr><td>Supporting Images:<br>';
//			foreach($v['image_data'] as $k1=>$v1)
//			{
//				$html .= '<img src="'.BASE_URL.'files/da_builder/'.$v1['ri_image'].'" height="220"><br><br>';
//			}
//			 $html .= '</td></tr>';
//		 }
		
		$html .= '</table>';
		if ($k <> $last_key) {
				$html .= '<br pagebreak="true" />';
			}
	}
	$html .= '</body></html>';
	
   create_report_rule("Report Rule Pdf", $html);
}

$print_id = $fwRequest->getParam('print_id', '');
if($print_id) {
	
	
	$sqlp = "SELECT * from report_rule where rr_id = ".$print_id;	
	$datap = $fwDb->queryOne($sqlp);
	
	$sqlimg = "select ri_image from report_rule_images where ri_rr_id = ".$print_id;

	$dataimg = $fwDb->query($sqlimg);
	
	$html = '<html><body>';
	
	
		
		$html .= '<table border="1" cellpadding="5">';
		
		$html .= '<tr><td> Text : '.$datap["rr_text"]. '</td></tr>';
		$html .= '<tr><td> Question : '.$datap["rr_question"]. '</td></tr>';
		$html .= '<tr><td> Answer : '.$datap["rr_answer"]. '</td></tr>';
		
		 if(!empty($dataimg)) 
		 {	
			$html .= '<tr><td>Supporting Images:<br>';
			foreach($dataimg as $k1=>$v1)
			{
				//$html .= '<img src="'.BASE_URL.'files/da_builder/'.$v1['ri_image'].'" height="220"><br><br>';
				 $folder_path = "files/da_builder/";  $object_name = $v1["ri_image"];
				 $file = get_file_raw_data($folder_path,$object_name);
				 $img1 = '<img src="'.$file.'" height="150">';
				 $html .= $img1;
			}
			 $html .= '</td></tr>';
		 }
		
		$html .= '</table>';
		
	
	$html .= '</body></html>';
	
   create_report_rule("Report Rule Pdf", $html);
	
	
}
