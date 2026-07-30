<?php

$doc = new Com("word.application");

$doc->Visible =0;

$doc->document->Add();

// set here page margins

$doc->selection->pageSetup->leftMargin = '2';

$doc->selection->pageSetup->rightMargin = '2';

//settings your font

$doc->selection->font->name = 'Arial';

$doc->selection->font->size = 10;

// here add text

$doc->selection->typeText("TEXT!");

// Save the doc file

$f_name = tempnam(sys_get_temp_dir(), "word");

$doc->document[1]->SaveAs($f_name);

$doc->quit();

unset($doc);

header("Content-type: application/vinod.ms-word");

header("Content-Disposition: attachment;Filename=MCN.doc");

readfile($f_name);

unlink($f_name);

?>