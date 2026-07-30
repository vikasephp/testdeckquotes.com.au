function toggleLayer( whichLayer, bid )
{
  var elem, vis;
  if( document.getElementById ) // this is the way the standards work
    elem = document.getElementById( whichLayer );
  else if( document.all ) // this is the way old msie versions work
      elem = document.all[whichLayer];
  else if( document.layers ) // this is the way nn4 works
    elem = document.layers[whichLayer];
  vis = elem.style;
  // if the style.display value is blank we try to figure it out here
  if(vis.display==''&&elem.offsetWidth!=undefined&&elem.offsetHeight!=undefined)
    vis.display = (elem.offsetWidth!=0&&elem.offsetHeight!=0)?'block':'none';
  vis.display = (vis.display==''||vis.display=='block')?'none':'block';
if(vis.display == 'block'){document.getElementById(bid).value='Cancel';}else{document.getElementById(bid).value='Add New';}
						document.getElementById('txtbusId').value = '';
						document.getElementById('txtCustomerId').value = '';	
						document.getElementById('be_source_of_enquiry_other').value = '';
						document.getElementById('be_comments').value = '';
						document.getElementById('be_request_info').value = '';
						document.getElementById('be_ipc_comments').value = '';
						document.getElementById('be_easts_comments').value = '';	
						document.getElementById('be_seller_email').value = '';
						document.getElementById('be_status').value = '0';
						document.getElementById('be_source_of_enquiry').value = "0";
						document.getElementById('be_answer_required').checked="0";
}


function toggleLayernew( whichLayer, bid )
{
  var elem, vis;
  if( document.getElementById ) // this is the way the standards work
    elem = document.getElementById( whichLayer );
  else if( document.all ) // this is the way old msie versions work
      elem = document.all[whichLayer];
  else if( document.layers ) // this is the way nn4 works
    elem = document.layers[whichLayer];
  vis = elem.style;
  // if the style.display value is blank we try to figure it out here
  if(vis.display==''&&elem.offsetWidth!=undefined&&elem.offsetHeight!=undefined)
    vis.display = (elem.offsetWidth!=0&&elem.offsetHeight!=0)?'block':'none';
  vis.display = (vis.display==''||vis.display=='block')?'none':'block';
if(vis.display == 'block'){document.getElementById(bid).value='Cancel';}else{document.getElementById(bid).value='Add New';}
}

function toggleLayer0pen( whichLayer, bid )
{
  var elem, vis;

  if( document.getElementById ) // this is the way the standards work
    elem = document.getElementById( whichLayer );
  else if( document.all ) // this is the way old msie versions work
      elem = document.all[whichLayer];
  else if( document.layers ) // this is the way nn4 works
    elem = document.layers[whichLayer];
  vis = elem.style;
  // if the style.display value is blank we try to figure it out here
  if(vis.display==''&&elem.offsetWidth!=undefined&&elem.offsetHeight!=undefined)
    vis.display = 'block';
	
	  if(vis.display=='none'&&elem.offsetWidth!=undefined&&elem.offsetHeight!=undefined)
    vis.display = 'block';
document.getElementById(bid).value='Cancel';

}


function div0pen( whichLayer )
{
	
  var elem, vis;

  if( document.getElementById ) // this is the way the standards work
    elem = document.getElementById( whichLayer );
  else if( document.all ) // this is the way old msie versions work
      elem = document.all[whichLayer];
  else if( document.layers ) // this is the way nn4 works
    elem = document.layers[whichLayer];
  vis = elem.style;
  // if the style.display value is blank we try to figure it out here
  if(vis.display==''&&elem.offsetWidth!=undefined&&elem.offsetHeight!=undefined)
    vis.display = 'block';

}


function tag()
{	
	 if(document.getElementById('isbyer').checked)
		{
			animatedcollapse.show('michael');}else{animatedcollapse.hide('michael');
		}
		
		
	 if(document.getElementById('isbyer').checked)
		{
			animatedcollapse.show('GeneralDisclaimer');}else{animatedcollapse.hide('GeneralDisclaimer');
		}
		if(document.getElementById('isbyer').checked)
		{
			
			RequestcheckListIframe('add_disclaimer','documentsIframe');
		}
}

function tag1()
{
	// var n1 = $("input:checked").length;
	 	if(document.getElementById('isseller').checked)
		{animatedcollapse.show('michael1');}else{animatedcollapse.hide('michael1');}
}	

function clipbord(){animatedcollapse.toggle('clipboard');}

	function init() {
		
if(document.getElementById('isbyer').checked)
		{
		animatedcollapse.show('michael');
		animatedcollapse.show('GeneralDisclaimer');
		RequestcheckListIframe('add_disclaimer','documentsIframe');
		RequestcheckListIframe('list_disclaimer','documentsIframelist');
		requestbyerInfo('byerlistdata',1, 'divbyerInfoToReturn');
		setTimeout("requestbyerInfo('BuyerMatchesInfo',1, 'BuyerMatchesInforeturn')", 500);
		
		}else{animatedcollapse.hide('michael');}
		
}
//window.onload = setTimeout('init()', 1000);

	function initseller() {

							if(document.getElementById('isseller').checked)
								{
								animatedcollapse.show('michael1');
								requestbyerInfo('byersaleenquiry',1, 'divbyersaleInfoToReturn');
								}else{
								animatedcollapse.hide('michael1');
								}
							}
								function initsellerbus() {
								requestsellerInfo(1);	}

		function ltrim(str, chars)
		  {
			  chars = chars || "\\s";
			  return str.replace(new RegExp("^[" + chars + "]+", "g"), "");
		  }
		function load_docs()
			{
			//RequestcheckListIframe('list_disclaimer','documentsIframelist');
			//closeTop();
			}
function getBaseURL() {
    var url = location.href;  // entire url including querystring - also: window.location.href;
    var baseURL = url.substring(0, url.indexOf('/', 14));


    if (baseURL.indexOf('http://localhost') != -1) {
        // Base Url for localhost
        var url = location.href;  // window.location.href;
        var pathname = location.pathname;  // window.location.pathname;
        var index1 = url.indexOf(pathname);
        var index2 = url.indexOf("/", index1 + 1);
        var baseLocalUrl = url.substr(0, index2);

        return baseLocalUrl + "/";
    }
    else {
        // Root Url for domain name
		
		if(baseURL == 'http://192.168.1.45' || baseURL == 'http://localhost')
		{
        	return baseURL + "/bes/";
		}
		else
		{
			return baseURL + "/";
		}
    }
};