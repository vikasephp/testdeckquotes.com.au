<?php

class Fw_Ecom_Shipping_Ups
{
    protected $AccessLicenseNumber;
    protected $UserId;
    protected $Password;
    protected $ShipperNumber;
    protected $ShipperCountry;
    protected $ShipperZip;
    protected $Services;
    
    public function __construct()
    {
        $this->Services = array();
        $this->Services['01'] = 'UPS Next Day Air';
        $this->Services['02'] = 'UPS Second Day Air';
        $this->Services['03'] = 'UPS Ground';
        $this->Services['12'] = 'UPS Three-Day Select';
        $this->Services['13'] = 'UPS Next Day Air Saver';
        $this->Services['14'] = 'UPS Next Day Air Early A.M. SM';
        $this->Services['59'] = 'UPS Second Day Air A.M.';
        $this->Services['65'] = 'UPS Saver';
    }    
    
    public function setAccessCredentials($AccessLicenseNumber, $UserId, $Password)
    {
        $this->AccessLicenseNumber = $AccessLicenseNumber;
        $this->UserId = $UserId;
        $this->Password = $Password;
    }
    
    public function setShipperDetails($ShipperNumber, $ShipperCountry, $ShipperZip)
    {
        $this->ShipperNumber = $ShipperNumber;
        $this->ShipperCountry = $ShipperCountry;
        $this->ShipperZip = $ShipperZip;
    }
    
    public function getServiceNameFromCode($ServiceCode)
    {
        return $this->Services[$ServiceCode];
    }
}