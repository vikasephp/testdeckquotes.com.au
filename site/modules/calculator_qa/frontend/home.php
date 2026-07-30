<?php
$pagenum = $fwRequest->getparamget('pagenum',0);

$fwViewData['ran'] =  rand(100000,999999);

$submit = $fwRequest->getParam('print', '');
if(!empty($submit))
{
	$heading = "Calculator Questions ans Answer";

	$qasql = "SELECT calculator_question_answer.qa_id, calculator_question_answer.qa_question, calculator_question_answer.qa_answer, 
	          calculator_question_answer.qa_last_updated, calculator_question_answer.qa_qed from calculator_question_answer order by qa_id ASC ";	

        if($qasql){$qaData = $fwDb->query($qasql);}
	
	$html = '';	
	foreach($qaData as $m)
	{
		if($m['qa_qed'] == 1 ) {	
			$html .=  "<b>" .clean_data_special($m['qa_question']). "  QAID ". $m['qa_id']."   QED - ".$m['qa_last_updated']."</b>";
			$html .= clean_data_special($m['qa_answer']) ."<br>";
		}
		
		else {
			
			$html .=  "<b>" .clean_data_special($m['qa_question']). "  QAID ". $m['qa_id']."</b>";
			$html .= clean_data_special($m['qa_answer']) ."<br>";
		}
	}
	
	create_open_PDF($heading,$html,$fname);
}

$listdata = $fwRequest->getParam($TABLE, array());

$keyword = $listdata['keyword'];
$where = "WHERE 1=1 ";

if($keyword) {
	$_SESSION['keyword'] = $keyword;
	$fwViewData['keyword']=$_SESSION['keyword'];
}
	
if($keyword OR $_SESSION['keyword']):
	$where .= " AND ".$TABLE.".qa_question LIKE '%".$_SESSION['keyword']."%' OR 
	".$TABLE.".qa_answer LIKE '%".$_SESSION['keyword']."%'";
	
	if($keyword) {
		$_SESSION['keyword'] = $keyword;
	}
	$fwViewData['keyword']=$_SESSION['keyword'];

elseif($_SESSION['keyword'] && $pagenum > 0):

	$where .= " AND ".$TABLE.".qa_question LIKE '%".$_SESSION['keyword']."%' OR
	 ".$TABLE.".qa_answer LIKE '%".$_SESSION['keyword']."%'";
	$fwViewData['keyword']=$_SESSION['keyword'];
endif;

//
 
 $keywordfs = $listdata['fs'];
 
 if($keywordfs) {

		$_SESSION['keywordfs'] = $keywordfs;
		$fwViewData['keywordfs']=$_SESSION['keywordfs'];
	}
//else { unset($_SESSION['keywordfs']); }

if($keywordfs  OR $_SESSION['keywordfs']):

	unset($_SESSION['keywordqaid']);
	$fwViewData['keywordqaid']='';
	
	$where .= " AND ".$TABLE.".qa_fact_sheets LIKE '%|".$_SESSION['keywordfs']."|%'";
	
	if($keywordfs) {
		$_SESSION['keywordfs'] = $keywordfs;
	}
	
	$fwViewData['keywordfs']=$_SESSION['keywordfs'];

elseif($_SESSION['keywordfs'] && $pagenum > 0):

	$where .= " AND ".$TABLE.".qa_fact_sheets LIKE '%|".$_SESSION['keywordfs']."|%' ";
	$fwViewData['keywordfs']=$_SESSION['keywordfs'];
endif;

 // 

 $keywordqaid = $listdata['qaid'];
 
 if($keywordqaid) {

	$_SESSION['keywordqaid'] = $keywordqaid;
	$fwViewData['keywordqaid']=$_SESSION['keywordqaid'];
  }
//else { unset($_SESSION['keywordfs']); }

if($keywordqaid  OR $_SESSION['keywordqaid']):
	$where .= " AND ".$TABLE.".qa_id = ".$_SESSION['keywordqaid'];
	
	if($keywordqaid) {
		$_SESSION['keywordqaid'] = $keywordqaid;
	}
	$fwViewData['keywordqaid']=$_SESSION['keywordqaid'];

elseif($_SESSION['keywordqaid'] && $pagenum > 0):

	$where .= " AND ".$TABLE.".qa_id = ".$_SESSION['keywordqaid'];
	$fwViewData['keywordqaid']=$_SESSION['keywordqaid'];
endif;

 // 
  
$showall = $fwRequest->getParam('showall', '');
if($showall)
{
	$where = "WHERE 1=1 ";
	unset($_SESSION['keyword']);
	unset($_SESSION['keywordfs']);
	unset($_SESSION['keywordqaid']);
	$fwViewData['keyword']='';
	$fwViewData['keywordfs']='';
	$fwViewData['keywordqaid']='';
}
 
$matsql = "SELECT ".$TABLE.".* FROM ".$TABLE." ".$where." ORDER BY ".$TABLE.".".$ID." ASC";	

if($matsql){$userData = $fwDb->query($matsql);}

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
	
	$k=0;
	foreach($listsnew as $k => $v)
	{
	 	  
	  $abc = trim($v['qa_fact_sheets'],'|');
	  $abc = "(0".str_replace('|', ',',$abc).")";

	  $sqlfs = "select doc_name from calculator_fact_sheet_doc where doc_id IN ".$abc;
	
	  $fsData = $fwDb->query($sqlfs);
	
	  $cat='';
	  foreach($fsData as $k1 => $v1)
	  {
		  $cat .= $v1['doc_name']."<br>";
	  }
	  
	   $listsnew[$k]['category'] = $cat;
	   
	   
		  
	  $k++;
	}
	
	
	$fwViewData['list'] = $listsnew;	
  }
}

$fwViewData['title'] = $MODULE_PLURAL;

$tabledoc = new Fw_Db_Table('calculator_fact_sheet_doc');
$tabledoc->setOrderBy('doc_id'.' ASC');
$fwViewData['document_list']=$tabledoc->getAllRows();

