<?php
$pagenum = $fwRequest->getparam('pagenum','');


$sql1 = "SELECT ps_que_ans.* , busness_status_task.bst_task_name from ps_que_ans 
         Inner join busness_status_task On ps_que_ans.ps_task_id = busness_status_task.bst_task_id
where ps_answer = ' '";
$userData1 = $fwDb->query($sql1);

$sql2 = "SELECT proposal_que_ans.*, proposal_task_list.bst_task_name from proposal_que_ans 
         Inner join proposal_task_list On proposal_que_ans.ps_task_id = proposal_task_list.bst_task_id
         where ps_answer = ' '";

$userData2 = $fwDb->query($sql2);

$k=0;
if(!empty($userData1))
{  
	foreach($userData1 as $k1 => $v1)
	{

			$link = BASE_URL. "business_status_taskAdmin.detail/bst_id/".$v1['ps_task_id'];
			$setdata2[$k]['ps_id'] = $v1['ps_id'];	
			$setdata2[$k]['ps_task_id'] = $v1['ps_task_id'];
			$setdata2[$k]['task_type'] = 'Project';
	                $setdata2[$k]['link'] = $link;
			$setdata2[$k]['bst_task_name'] = $v1['bst_task_name'];
			$setdata2[$k]['ps_question'] = stripslashes($v1['ps_question']);
			$setdata2[$k]['ps_who_to_answer_it'] = $v1['ps_who_to_answer_it'];
			$k++;
	}
  
 }

if(!empty($userData2))
{  
	foreach($userData2 as $k2 => $v2)
	{

			$link = BASE_URL. "proposal_task_listAdmin.detail/bst_id/".$v2['ps_task_id'];	
			$setdata2[$k]['ps_id'] = $v2['ps_id'];
			$setdata2[$k]['ps_task_id'] = $v2['ps_task_id'];
			$setdata2[$k]['task_type'] = 'Proposal';
	                $setdata2[$k]['link'] = $link;
			$setdata2[$k]['bst_task_name'] = '';
			$setdata2[$k]['ps_question'] = stripslashes($v2['ps_question']);
			$setdata2[$k]['bst_task_name'] = $v2['bst_task_name'];
			$setdata2[$k]['ps_who_to_answer_it'] = $v2['ps_who_to_answer_it'];
			$k++;
	}
  
 }

$fwViewData['list'] = $setdata2;
$fwViewData['title'] = "Project Status And Proposal Status Task Unanswered Question Report";