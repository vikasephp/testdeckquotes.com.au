<?php

require_once(LIB_DIR . 'Fw/Ecom/Shipping/Ups.php');

class Fw_Ecom_Shipping_Ups_TimeInTransit extends Fw_Ecom_Shipping_Ups
{
    public function __construct()
    {
        parent::__construct();
    }
    
    public function getTransitTime($service, $weight, $dest_zip, $dest_country = 'US', $src_zip = '', $src_country = '')
    {
        if (empty($src_zip))
        {
            $src_zip = $this->ShipperZip;
            $src_country = $this->ShipperCountry;
        }
        
        $request = "<?xml version=\"1.0\"?>  
<AccessRequest xml:lang=\"en-US\">  
    <AccessLicenseNumber>$this->AccessLicenseNumber</AccessLicenseNumber>  
    <UserId>$this->UserId</UserId>  
    <Password>$this->Password</Password>  
</AccessRequest>  
<?xml version=\"1.0\"?>
    <TimeInTransitRequest xml:lang='en-US'>
        <Request>
            <TransactionReference>
                <CustomerContext>TNT_D Origin Country Code</CustomerContext>
                <XpciVersion>1.0002</XpciVersion>
            </TransactionReference>
        <RequestAction>TimeInTransit</RequestAction>
    </Request>
    <TransitFrom>
        <AddressArtifactFormat>
            <PostalCode>$src_zip</PostalCode>  
            <CountryCode>$src_country</CountryCode>  
        </AddressArtifactFormat>
    </TransitFrom>
    <TransitTo>
        <AddressArtifactFormat>
            <PostalCode>$dest_zip</PostalCode>  
            <CountryCode>$dest_country</CountryCode>   
        </AddressArtifactFormat>
    </TransitTo>
    <ShipmentWeight>
        <UnitOfMeasurement>  
            <Code>LBS</Code>  
        </UnitOfMeasurement>  
        <Weight>$weight</Weight>  
    </ShipmentWeight>
    <PickupDate>20070608</PickupDate>
</TimeInTransitRequest>";
    
        $ch = curl_init('https://wwwcie.ups.com/ups.app/xml/TimeInTransit');  
        curl_setopt($ch, CURLOPT_HEADER, 0);  
        curl_setopt($ch, CURLOPT_POST, 1);  
        curl_setopt($ch, CURLOPT_TIMEOUT, 60);  
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);  
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);  
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);  
        curl_setopt($ch, CURLOPT_POSTFIELDS, $request);  
        $response = curl_exec($ch);

        file_put_contents('C:\RatesAndServiceSelection.txt', $request . "\n\n\n\n" . $response);     
        
        $objXml = new SimpleXMLElement($response);



  
}