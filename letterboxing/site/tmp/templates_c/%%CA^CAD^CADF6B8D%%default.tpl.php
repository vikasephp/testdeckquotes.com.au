<?php /* Smarty version 2.6.20, created on 2023-07-25 06:14:20
         compiled from default/default.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'date_format', 'default/default.tpl', 298, false),)), $this); ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<base href="<?php echo $this->_tpl_vars['BASE_URL']; ?>
" />
<link rel="stylesheet" type="text/css" href="<?php echo $this->_tpl_vars['BASE_URL']; ?>
css/default/cis-styles.css" />

<link rel="stylesheet" type="text/css" href="<?php echo $this->_tpl_vars['BASE_URL']; ?>
css/default/menu_manoj.css" />
<title>.:: <?php echo $this->_tpl_vars['SITE_NAME']; ?>
 - <?php echo $this->_tpl_vars['title']; ?>
 ::.</title>
<!-- Beginning of compulsory code below -->
<link rel="stylesheet" type="text/css" href="<?php echo $this->_tpl_vars['BASE_URL']; ?>
/js/chrometheme/chromestyle2.css" />
<script type="text/javascript" src="<?php echo $this->_tpl_vars['BASE_URL']; ?>
/js/chromejs/chrome.js"></script>
<link href="<?php echo $this->_tpl_vars['BASE_URL']; ?>
css/default/css/dropdown/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
<link href="<?php echo $this->_tpl_vars['BASE_URL']; ?>
css/default/css/dropdown/themes/default/default.css" media="screen" rel="stylesheet" type="text/css" />
<link href="<?php echo $this->_tpl_vars['BASE_URL']; ?>
css/default/loader.css" media="screen" rel="stylesheet" type="text/css" />
<link rel="canonical" href="<?php echo $this->_tpl_vars['BASE_URL']; ?>
" />
<link rel="shortcut icon" href="<?php echo $this->_tpl_vars['BASE_URL']; ?>
images/favicon.ico" >
<!--[if lt IE 7]>
<script type="text/javascript" src="<?php echo $this->_tpl_vars['BASE_URL']; ?>
css/default/js/jquery/jquery.js"></script>
<script type="text/javascript" src="<?php echo $this->_tpl_vars['BASE_URL']; ?>
css/default/js/jquery/jquery.dropdown.js"></script>
<![endif]-->
<!-- / END -->
<script type="text/javascript" src="<?php echo $this->_tpl_vars['BASE_URL']; ?>
js/calendar/datepicker.js"></script>
<script type="text/javascript" src="<?php echo $this->_tpl_vars['BASE_URL']; ?>
css/default/load.js"></script>
<link type="text/css" rel="stylesheet" href="<?php echo $this->_tpl_vars['BASE_URL']; ?>
js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="<?php echo $this->_tpl_vars['BASE_URL']; ?>
js/tabview/tabcontent.css" />
<script type="text/javascript" src="<?php echo $this->_tpl_vars['BASE_URL']; ?>
js/jquery.min.js"></script>
<script type="text/javascript" src="<?php echo $this->_tpl_vars['BASE_URL']; ?>
js/animatedcollapse.js"></script>
<script type="text/javascript" src="<?php echo $this->_tpl_vars['BASE_URL']; ?>
js/default.js"></script>
<script type="text/javascript">
animatedcollapse.addDiv('clipboard', 'fade=1')
animatedcollapse.init()
var url = "<?php echo $this->_tpl_vars['BASE_URL']; ?>
site.clipboard?cb="; // The server-side script

      function handleHttpClipboardResponse() {   
        if (http.readyState == 4) {
              if(http.status==200) {
                  var results=http.responseText;
			  if(results !='')
			  	{//document.getElementById('divCustomerInfo').style.visibility = 'visible';
				document.getElementById('clipboard_data').innerHTML = results;
				closeTop();
				}
            }
          }
        }
       
        function requestClipboardData() {     
            var clipboard_data = document.getElementById("clipboard_data").value;
			
			var clipurl =  url + clipboard_data+"&random=" + Math.random();
            http.open("GET",clipurl, true);
            http.onreadystatechange = handleHttpClipboardResponse;
            http.send(null);
			showTop();
        }

<!--Ajax Common function END-->
		
function getHTTPObject() {
  var xmlhttp;

  if(window.XMLHttpRequest){
    xmlhttp = new XMLHttpRequest();
  }
  else if (window.ActiveXObject){
    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    if (!xmlhttp){
        xmlhttp=new ActiveXObject("Msxml2.XMLHTTP");
    	}
	}
  return xmlhttp; 
}
var http = getHTTPObject(); // We create the HTTP Object

</script>
<?php if ($this->_tpl_vars['clipboardData']): ?>
<script type="text/javascript">
	setTimeout("clipbord()", 500);
</script>
<?php endif; ?>
<style>
.black_overlay {
	display: none;
	position: absolute;
	top: 0%;
	left: 0%;
	bottom:0%;
	width: 100%;
	height: 320%;
	background-color: white;
	z-index:1001;
	-moz-opacity: 0.8;
	opacity:.80;
	filter: alpha(opacity=80);
}
.white_content {
	display: none;
	position: absolute;
	top: 50%;
	left: 45%;
	padding: 0px;
	border: 0px solid orange;
	background-color: white;
	z-index:1002;
	overflow: auto;
}

nav ul ul li {background:#609 !important; }
nav { background:#154f6c !important ;}
nav ul li { background:#154f6c !important ;}
 
}

</style>
</head><body scroll="no">
<div id="screenoverlay" style="visibility:hidden;"></div>
<div id="wrapper">
<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" class="mainTableBg">
<tr>
<td align="left" valign="top">
  <table  border="0" cellspacing="0" cellpadding="0" align="center" class="subtabel" width="99%">
      <!-- Top Blue Bar Starts -->
    <tr>
      <td width="10" class="blueBarBg"><img src="<?php echo $this->_tpl_vars['BASE_URL']; ?>
images/blu-strip-top-left.jpg" alt="" height="34"  /></td>
      <td width="100%" align="left" valign="middle" class="blueBarBg">
     <h2 style="color:#FFF;">  Welcome to CGFB </h2>
          <!--<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
          <tr>
          <td width="90%" align="left"><p> Welcome <span> <?php if (isset ( $this->_tpl_vars['_SESSION']['user'] ) && $this->_tpl_vars['_SESSION']['user']['user_id'] > 0): ?>
              <?php echo $this->_tpl_vars['_SESSION']['user']['user_name']; ?>
&nbsp;&nbsp;|&nbsp;&nbsp;<a href="<?php echo $this->_tpl_vars['BASE_URL']; ?>
logout.htm">Log Out</a> <?php else: ?>
              Guest!&nbsp;&nbsp;|&nbsp;&nbsp;<a href="<?php echo $this->_tpl_vars['BASE_URL']; ?>
login.htm">Login</a><?php endif; ?>
              &nbsp;&nbsp;|&nbsp;&nbsp;<a href="<?php echo $this->_tpl_vars['BASE_URL']; ?>
home.htm">Home</a> </span> </p></td>
          <td><p><span><?php if ($this->_tpl_vars['admin_menu']): ?><a href="<?php echo $this->_tpl_vars['BASE_URL']; ?>
admin.home">Admin Panel</a> <?php endif; ?></span></p></td>
          </tr>
         </table>-->
	 </td>
    <td width="2" align="right" class="blueBarBg"><img src="<?php echo $this->_tpl_vars['BASE_URL']; ?>
images/blu-strip-top-right.jpg" width="12" height="34" />
    </td>
    </tr>
    <!-- Top Blue Bar Ends -->
    <!-- Search Starts -->
    <tr>
    <td align="left" valign="top" colspan="3">
     <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" height="80">
     <!-- Search Ends -->
     <!-- Breadcrumbs Starts -->
     <tr>
     <td align="left" valign="top" colspan="3" ><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr>
        <!-- <td width="3"><img src="<?php echo $this->_tpl_vars['BASE_URL']; ?>
images/breadcrumbs-left-corner.jpg" alt="" /></td>-->
         <td width="100%" align="left" valign="middle" >
         
   <?php if (isset ( $this->_tpl_vars['_SESSION']['user'] ) && $this->_tpl_vars['_SESSION']['user']['user_id'] > 0): ?>
         
              <table cellpadding="0" cellspacing="0" border="0" width="1430">
                <tr>
                  <td valign="top" width="100%">
                  
  <nav>

  <label for="drop" class="toggle">Menu</label>
  <input type="checkbox" id="drop" />
  <ul class="menu" style="z-index:2222222" >
      <li style="z-index:222222">
      <!-- First Tier Drop Down -->
      <label for="drop-1" class="toggle">Customers</label>
      <a href="javascript:void();">Customers</a>
  
      <input type="checkbox" id="drop-1" />
      <ul style="z-index:2222;">
           <li><a href="<?php echo $this->_tpl_vars['BASE_URL']; ?>
customer.list">Customer Search</a></li>
           <li><a href="<?php echo $this->_tpl_vars['BASE_URL']; ?>
customer.detail">New Customer</a></li> 
           <li><a href="<?php echo $this->_tpl_vars['BASE_URL']; ?>
business.list">Project Search</a></li> 
           <li><a href="<?php echo $this->_tpl_vars['BASE_URL']; ?>
business.detail">New Project</a> </li>
           <li><a href="<?php echo $this->_tpl_vars['BASE_URL']; ?>
businessqa.list">Project Q & A Search</a> </li>

      </ul>

    </li>

    
      <li>
      <label for="drop-9" class="toggle">Email Library</label>
      <a href="javascript:void();">Email Library</a>
      <input type="checkbox" id="drop-9" />
      <ul>
        <li><a href="<?php echo $this->_tpl_vars['BASE_URL']; ?>
emaillibrary.home">Email Library</a></li>
        <li><a href="<?php echo $this->_tpl_vars['BASE_URL']; ?>
emaillibrary.email_log_ms">Email Log MS</a></li>
        <li><a href="<?php echo $this->_tpl_vars['BASE_URL']; ?>
emaillibrary.email_log_op">Email Log OP</a></li>
        <li><a href="<?php echo $this->_tpl_vars['BASE_URL']; ?>
emaillibrary.email_log_re">Email Log RE</a></li>
        <li><a href="<?php echo $this->_tpl_vars['BASE_URL']; ?>
emaillibrary.email_draft">Draft Email</a></li>
        
      </ul>
    </li>       
 <li>
      <label for="drop-5" class="toggle">Style Guide & Formula</label>
      <a href="javascript:void();">Style Guide & Formula</a>
      <input type="checkbox" id="drop-5" />
      <ul>
   
        <li><a href="<?php echo $this->_tpl_vars['BASE_URL']; ?>
styleformula.home">Style Guide and Formula</a></li>
        <li><a href="<?php echo $this->_tpl_vars['BASE_URL']; ?>
galleries.home">Image Galleries</a></li>
        <li><a href="<?php echo $this->_tpl_vars['BASE_URL']; ?>
kitomestyleguide.home">Kitome Style Guide</a></li>
        <li><a href="<?php echo $this->_tpl_vars['BASE_URL']; ?>
styletextreport.home">Style Text Report</a></li>
        
      </ul>
    </li>
    
   <li>
      <label for="drop-6" class="toggle">Roofing Sales Report</label>
      <a href="javascript:void();">Roofing Sales Report</a>
      <input type="checkbox" id="drop-6" />
      <ul>
        <li><a href="<?php echo $this->_tpl_vars['BASE_URL']; ?>
roofing_sales_report.home">Roofing Sales Report</a></li>
      </ul>
    </li>
   
   <li>
      <label for="drop-7" class="toggle">Tempate Master List</label>
      <a href="javascript:void();">Tempate Master List</a>
      <input type="checkbox" id="drop-7" />
      <ul>
        <li><a href="<?php echo $this->_tpl_vars['BASE_URL']; ?>
templatedoc.home">Tempate Master List</a></li>
      </ul>
    </li>
   
  </ul>
</nav>
                  
	     <script type="text/javascript">
            cssdropdown.startchrome("chromemenu")
            </script>
                  
                  </td>
                </tr>
              </table>
    
    
 <script type="text/javascript" language="javascript">

$(document).ready(function(){

    $("#waiting").click(function(){        
		
			 $('#show').css('display', 'block');
		
    });

});

</script>
         
              
    <?php endif; ?> 
              
              </td>
       
          </tr>
          <!-- Shadow Starts -->
          <tr>
            <td colspan="3"><img src="<?php echo $this->_tpl_vars['BASE_URL']; ?>
images/horizental-shadow.jpg" height="13" width="100%"  alt="" /></td>
          </tr>
          <!-- Shadow Ends -->
        </table></td>
    </tr>
    <!-- Breadcrumbs Ends -->
    <!-- Content Area Starts -->
    <tr>
      <td align="left" valign="top" colspan="3"><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" height="580">
          
          <?php if (isset ( $this->_tpl_vars['_SESSION']['user'] ) && $this->_tpl_vars['_SESSION']['user']['user_id'] > 0): ?>
          <tr>
            <td width="80%" align="center" valign="top" height="500"> <?php $_from = $this->_tpl_vars['fwSubViews']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['fwSubView']):
?>
              <!-- sub-view start -->
              <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => $this->_tpl_vars['fwSubView'], 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
              <!-- sub-view end -->
              <?php endforeach; endif; unset($_from); ?> </td>
          </tr>
          <?php else: ?>
          <tr>
            <td width="80%" align="left" valign="top"> <?php $_from = $this->_tpl_vars['fwSubViews']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['fwSubView']):
?>
              <!-- sub-view start -->
              <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => $this->_tpl_vars['fwSubView'], 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
              <!-- sub-view end -->
              <?php endforeach; endif; unset($_from); ?> </td>
          </tr>
          <?php endif; ?>
        </table></td>
    </tr>
    <!-- Content Area Ends -->
    <!-- Footer Starts -->
    <tr>
      <td colspan="3" align="left" valign="top" class="footer"><table width="974" border="0" cellspacing="0" cellpadding="0" align="center">
          <tr>
            <td colspan="14" align="left" valign="top" class="copyrights"><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                <tr>
                  <td width="259" align="center"><p>Copyright &#169; 2010-<?php echo ((is_array($_tmp=time())) ? $this->_run_mod_handler('date_format', true, $_tmp, "%Y") : smarty_modifier_date_format($_tmp, "%Y")); ?>
. <?php echo $this->_tpl_vars['SITE_NAME']; ?>
. All Rights Reserved. Developed By <a href="http://www.ephpsolutions.com" target="_blank">EPHPSolutions</a></p></td>
                  <td width="15"></td>
                </tr>
              </table></td>
          </tr>
        </table></td>
    </tr>
    <!-- Footer Ends -->
  </table></td>
</tr>
</table>
    <!-- Main Table Ends -->
</div>
<!--EndHTML-->
<div id="topbox" style="visibility:hidden;" align="center" style="vertical-align:middle;">
</div>
</body>
</html>