<?php /* Smarty version 2.6.20, created on 2025-09-10 20:45:49
         compiled from file:/home/deckquotes/deckquotes.com.au/public_html/home_warranty_policy/site/modules/site/frontend/home.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'stripslashes', 'file:/home/deckquotes/deckquotes.com.au/public_html/home_warranty_policy/site/modules/site/frontend/home.tpl', 73, false),array('function', 'math', 'file:/home/deckquotes/deckquotes.com.au/public_html/home_warranty_policy/site/modules/site/frontend/home.tpl', 127, false),)), $this); ?>
<style>

body{
	margin:0;
	color:#6a6f8c;
	font:600 16px/18px 'Open Sans',sans-serif;
}
*,:after,:before{box-sizing:border-box}
.clearfix:after,.clearfix:before{content:'';display:table}
.clearfix:after{clear:both;display:block}
a{color:inherit;text-decoration:none}

.hr{
	height:2px;
	margin:60px 0 50px 0;
	background:rgba(255,255,255,.2);
}
.foot-lnk{
	text-align:center;
}

.title {
 	text-align:center;
	font-size:24px;
	color:#FF3;
	margin-bottom:10px;
}
.set2 { font-size:10px !important; 
       width:60px !important; display:inline-block; 
	  padding-top:1px !important;
	  padding-bottom: 1px !important;
	  padding-left:1px !important;
	  height:25px !important; 
	  margin-top:7px;}
	  
#fancybox-wrap {z-index:9999999;} 

</style>

<link rel="stylesheet" type="text/css" href="<?php echo $this->_tpl_vars['BASE_URL']; ?>
css/default/style_manoj.css" />
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => $this->_tpl_vars['jdata'], 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => $this->_tpl_vars['tiny_basic'], 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<br />
<h3 class="page-title"><?php echo $this->_tpl_vars['title']; ?>
</h3>
<br />

<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
				<th class="topmenu" align="center" valign="middle" width="5%">Sr. No.</th>  
				<th class="topmenu" align="center" valign="middle" width="15%">Project Address</th> 
				<th class="topmenu" align="center" valign="middle" width="10%">Multiple Projects</th>
				<th class="topmenu" align="center" valign="middle" style="min-width: 100px;" data-col="project_status">Project Status</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Status</th>
				<th class="topmenu" align="center" valign="middle" width="8%">Ref</th>
				<th class="topmenu" align="center" valign="middle" width="10%">Policy Number</th> 
				<th class="topmenu" align="center" valign="middle" width="7%">Value</th> 
				<th class="topmenu" align="center" valign="middle" width="7%">Open Date</th> 
				<th class="topmenu" align="center" valign="middle" width="7%">Close Date</th> 
				<th class="topmenu" align="center" valign="middle" width="10%">Certificate of Occupancy</th> 
				<th class="topmenu" align="center" valign="middle" width="10%">Home Warranty Certificate</th> 
				<th class="topmenu" align="center" valign="middle" width="5%">Public Status</th>
            </tr>
        </thead>
    <tbody>

 <?php $_from = $this->_tpl_vars['list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['item']):
?>

    <tr bgcolor="#FFFFFF">

		<td><?php echo $this->_tpl_vars['item']['hw_id']; ?>
</td>
		<td><?php echo ((is_array($_tmp=$this->_tpl_vars['item']['hw_project_address'])) ? $this->_run_mod_handler('stripslashes', true, $_tmp) : stripslashes($_tmp)); ?>
</td> 
		<td><?php echo $this->_tpl_vars['item']['hw_multiple_proj']; ?>
</td>
		<td data-col="project_status">
			<?php echo $this->_tpl_vars['item']['project_status']; ?>

		</td>
		<td>
			<?php if ($this->_tpl_vars['item']['hw_status'] == 1): ?>Open<?php else: ?>Close<?php endif; ?>
		</td>
		<td><?php echo $this->_tpl_vars['item']['hw_ref']; ?>
</td>
		<td><?php echo $this->_tpl_vars['item']['hw_policy_num']; ?>
</td>
		<td><?php echo $this->_tpl_vars['item']['hw_value']; ?>
</td>
		<td><?php echo $this->_tpl_vars['item']['hw_open_date']; ?>
</td>
		<td><?php echo $this->_tpl_vars['item']['hw_close_date']; ?>
</td>
		<td>
			<?php if ($this->_tpl_vars['item']['document173']): ?> 
			<!--<a href="/home_warranty_database.download_content?file_name=<?php echo $this->_tpl_vars['item']['document173']; ?>
&module_name=home_warranty_database.home" >Download</a>-->
			<a href="/home_warranty_policy.download_content?file_name=<?php echo $this->_tpl_vars['item']['document173']; ?>
&module_name=home_warranty_policy.home" >Download</a>
			<?php endif; ?>
		</td>
		<td>
			<?php if ($this->_tpl_vars['item']['document121']): ?>
			<!--<a href="/home_warranty_database.download_content?file_name=<?php echo $this->_tpl_vars['item']['document121']; ?>
&module_name=home_warranty_database.home" >Download</a><br/>-->
			<a href="/home_warranty_policy.download_content?file_name=<?php echo $this->_tpl_vars['item']['document121']; ?>
&module_name=home_warranty_policy.home" >Download</a>
			<?php endif; ?>
		</td>
		<td>
			<form name="recmet3" method="post" action="">
				<input type="hidden" name="public_status[<?php echo $this->_tpl_vars['item']['hw_id']; ?>
]" value="0" />
				<label class="switch">
					<input class="switch-input" type="checkbox" name="public_status[<?php echo $this->_tpl_vars['item']['hw_id']; ?>
]" value="1" onclick="this.form.submit();" <?php if ($this->_tpl_vars['item']['hw_public_status'] == 1): ?> checked="checked" <?php endif; ?>>
					<span class="switch-label" data-on="Open" data-off="Close"></span>
					<span class="switch-handle"></span> <br />
				</label>
			</form>
			<?php if ($this->_tpl_vars['item']['hw_public_status'] == 1): ?>
				<?php if ($this->_tpl_vars['item']['hw_public_status_user']): ?><?php echo $this->_tpl_vars['item']['hw_public_status_user']; ?>
<br/><?php endif; ?>
				<?php if ($this->_tpl_vars['item']['hw_public_status_date']): ?><?php echo $this->_tpl_vars['item']['hw_public_status_date']; ?>
<br/><?php endif; ?>
			<?php endif; ?>
		</td>
		
    </tr>  
  <?php endforeach; endif; unset($_from); ?>
  </tbody>
  </table>
    
     <?php if ($this->_tpl_vars['last'] > 1): ?> 
    <table width="90%" border="0" cellpadding="0" cellspacing="0">   
    <tr>  
  <?php if ($this->_tpl_vars['list']): ?>   
<td align="center">
 <div class='pagination'>
 <?php if ($this->_tpl_vars['pagenum'] == 1): ?>
 <span class='disabled'>&#171; previous</span>
 <?php else: ?>
<a class="pagination" href="<?php echo $this->_tpl_vars['BASE_URL']; ?>
<?php echo $this->_tpl_vars['XFA']['home']; ?>
/pagenum/<?php echo smarty_function_math(array('equation' => 'x - y','x' => $this->_tpl_vars['pagenum'],'y' => 1), $this);?>
" title="Previous">&#171; previous</a>
 <?php endif; ?>
        
<?php if ($this->_tpl_vars['pagenum'] != 1): ?>
 <span class="paginate"><a class="pagination"  href="<?php echo $this->_tpl_vars['BASE_URL']; ?>
<?php echo $this->_tpl_vars['XFA']['home']; ?>
/pagenum/1" title="<?php echo $this->_tpl_vars['page_num']; ?>
 Page">1</a></span>
 <?php else: ?><span class='current'>1</span>
 <?php endif; ?><?php if ($this->_tpl_vars['pagenum'] != 2): ?>
   <span class="paginate"><a class="pagination"  href="<?php echo $this->_tpl_vars['BASE_URL']; ?>
<?php echo $this->_tpl_vars['XFA']['home']; ?>
/pagenum/2" title="<?php echo $this->_tpl_vars['page_num']; ?>
 Page">2</a></span>
<?php else: ?><span class='current'>2</span>
 <?php endif; ?>
<?php if ($this->_tpl_vars['paginateprev']['0'] > 3): ?>
...
<?php endif; ?>
<?php $_from = $this->_tpl_vars['paginateprev']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['page_key'] => $this->_tpl_vars['page_num']):
?>
	<?php if ($this->_tpl_vars['page_num'] == $this->_tpl_vars['pagenum'] || $this->_tpl_vars['page_num'] <= 2): ?>
   		<?php elseif ($this->_tpl_vars['page_num'] == $this->_tpl_vars['lastone']): ?>
    
    	<?php else: ?> <span class="paginate"><a class="pagination"  href="<?php echo $this->_tpl_vars['BASE_URL']; ?>
<?php echo $this->_tpl_vars['XFA']['home']; ?>
/pagenum/<?php echo $this->_tpl_vars['page_num']; ?>
" title="<?php echo $this->_tpl_vars['page_num']; ?>
 Page"><?php echo $this->_tpl_vars['page_num']; ?>
</a></span>
        <?php endif; ?>
        <?php endforeach; endif; unset($_from); ?>

<?php $_from = $this->_tpl_vars['paginatenext']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['page_key'] => $this->_tpl_vars['page_num2']):
?>
  	<?php if ($this->_tpl_vars['page_num2'] < $this->_tpl_vars['last'] && $this->_tpl_vars['page_num2'] != $this->_tpl_vars['lastone']): ?>
    			<?php if ($this->_tpl_vars['page_num2'] == 1): ?>
                <?php elseif ($this->_tpl_vars['page_num2'] == 2): ?>
                <?php else: ?>
                    <?php if ($this->_tpl_vars['page_num2'] == $this->_tpl_vars['pagenum'] || $this->_tpl_vars['page_num2'] <= 0): ?>
                            <span class='current'> <?php echo $this->_tpl_vars['page_num2']; ?>
</span>
                    <?php else: ?>
                        <a class="pagination"  href="<?php echo $this->_tpl_vars['BASE_URL']; ?>
<?php echo $this->_tpl_vars['XFA']['home']; ?>
/pagenum/<?php echo $this->_tpl_vars['page_num2']; ?>
" title="<?php echo $this->_tpl_vars['page_num2']; ?>
 Page"><?php echo $this->_tpl_vars['page_num2']; ?>
</a>
                     <?php endif; ?>
                <?php endif; ?>     
    <?php endif; ?>
<?php endforeach; endif; unset($_from); ?>
<?php if ($this->_tpl_vars['page_num2'] < $this->_tpl_vars['lasttow']): ?>
...
<?php endif; ?>
<?php if ($this->_tpl_vars['lastone'] == 1): ?>
<?php elseif ($this->_tpl_vars['lastone'] == 2): ?>
<?php else: ?>
<?php if ($this->_tpl_vars['pagenum'] == $this->_tpl_vars['lastone']): ?>
<span class='current'><?php echo $this->_tpl_vars['lastone']; ?>
</span>
<?php else: ?>
<a class="pagination"  href="<?php echo $this->_tpl_vars['BASE_URL']; ?>
<?php echo $this->_tpl_vars['XFA']['home']; ?>
/pagenum/<?php echo $this->_tpl_vars['lastone']; ?>
" title="<?php echo $this->_tpl_vars['lastone']; ?>
 Page"><?php echo $this->_tpl_vars['lastone']; ?>
</a>
<?php endif; ?>
<?php endif; ?>
<?php if ($this->_tpl_vars['last'] == 1): ?>
<?php elseif ($this->_tpl_vars['last'] == 2): ?>
<?php else: ?>
<?php if ($this->_tpl_vars['pagenum'] == $this->_tpl_vars['last']): ?>
<span class='current'><?php echo $this->_tpl_vars['last']; ?>
</span>
<?php else: ?>
 <a class="pagination"  href="<?php echo $this->_tpl_vars['BASE_URL']; ?>
<?php echo $this->_tpl_vars['XFA']['home']; ?>
/pagenum/<?php echo $this->_tpl_vars['last']; ?>
" title="<?php echo $this->_tpl_vars['last']; ?>
 Page"><?php echo $this->_tpl_vars['last']; ?>
</a>
<?php endif; ?>
<?php endif; ?>
<?php if ($this->_tpl_vars['pagenum'] == $this->_tpl_vars['last']): ?>
<span class='disabled'>next &#187;</span>
 <?php else: ?>
<a class="pagination" href="<?php echo $this->_tpl_vars['BASE_URL']; ?>
<?php echo $this->_tpl_vars['XFA']['home']; ?>
/pagenum/<?php echo smarty_function_math(array('equation' => "x + y",'x' => $this->_tpl_vars['pagenum'],'y' => 1), $this);?>
" title="Next">next &#187;</a></div>
 <?php endif; ?>
</td>
<?php else: ?>
<td align="center" height="300">Record Not found... </td>
<?php endif; ?>
 </tr>
</table> 
<?php endif; ?>
</div>