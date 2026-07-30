<?php
$fwMainView = 'file:' . getcwd() . '/calc.tpl';
$pid = $fwRequest->getParam('pid', 0);
$kid = $fwRequest->getParam('kid', 0);

switch($kid)
	{
		case 10:
	$fwViewData['showcalcsc'] = "Concrete SubFrame - COGS";
		break;
		
		case 11:
	$fwViewData['showcalcsl'] = "Concrete SubFrame - Labour";
		break;
		
		case 12:
	$fwViewData['showcalcscc'] = "Concrete SubFrame Custom - COGS";
		break;
		
		case 13:
	$fwViewData['showcalcsccl'] = "Concrete SubFrame Custom - Labour";
		break;
		
		case 14:
	$fwViewData['showcalscl'] = "Stairs Custom - COG";
		break;
		
		case 15:
	$fwViewData['showcalscl'] = "Stairs Custom - Labour";
		break;
		
		
		
		default: 
	$fwViewData['showcalc'] = "Show";
	}
$fwViewData['pid'] = $pid;
$submit = $fwRequest->getParam('subAddDetail', '');