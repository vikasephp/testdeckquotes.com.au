<?php
require BASE_DIR.'file_upload/server/s3/aws-autoloader.php';

include_once('Aws\S3\S3Client');
include_once('Aws\S3\Exception\S3Exception');

$s3 = array(
		'BUCKET_NAME' => 'deckquote',	
		'CREDENTIALS' => array(	
			'key' => 'AKIA2AMNCYNN7O5EFUFK',
		        'secret' => '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'
				)
		);

/*
Array
(
    [BUCKET_NAME] => portfolio0143
    [CRENDETAILS] => Array
        (
            [key] => AKIAITBHG25MF7PCBKSQ
            [secret] => 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
        )

    [REGION] => ap-south-1
    [VERSION] => 2006-03-01
)*/

$s3Client = S3Client::factory(array(
    'credentials' => $s3['CRENDETAILS'],
    'region' => 'ap-southeast-2',
    'version' => '2006-03-01'
));

echo "<pre>";
print_r($s3Client);;
die;
// Set Amazon s3 credentials
/*$client = S3Client::factory(
  array(
    'key'    => "AKIA2AMNCYNN7O5EFUFK",
    'secret' => "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"
  )
);*/

//try {
//  $client->putObject(array(
//    'Bucket'=>'deckquote',
//    'Key' =>  'upload/',
//    'SourceFile' => 'home/admin13/public_html/table.php',
//    'StorageClass' => 'REDUCED_REDUNDANCY'
//  ));
//
//} catch (S3Exception $e) {
//  // Catch an S3 specific exception.
//  echo $e->getMessage();
//}