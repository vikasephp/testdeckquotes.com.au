<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/treemenu/_styles.css" media="screen">
<ol class="tree" style="margin:0;">
		<li  style="margin:0;">
			<label for="folder1">GCON Docs</label> <input type="checkbox" checked disabled id="folder1" /> 
			<ol>
            {{foreach from=$gfodersdata item='item' key='key'}}
                <li><label for="subfolder1" title="{{$item.title}}">{{$item.title|truncate:"20"}}</label> <input type="checkbox" id="subfolder1" /> 
        	<ol>{{foreach from=$gfilesdata item='inneritem' key='innerkey'}}
               {{if $inneritem.parents.1.id == $item.id}} 
            <li class="file"><a name="{{$inneritem.alternateLink}}" style="cursor:pointer;"	 title="{{$inneritem.title}}" class="openit">{{$inneritem.title|truncate:"20"}}</a></li>               {{elseif $inneritem.parents.0.id == $item.id}}
      		<li class="file"><a name="{{$inneritem.alternateLink}}" style="cursor:pointer;"	 title="{{$inneritem.title}}" class="openit">{{$inneritem.title|truncate:"20"}}</a></li>
				{{/if}}
                {{/foreach}}
			</ol></li>
           {{/foreach}}
            <!--{{foreach from=$gfilesdata item='outeritem' key='innerkey'}}
            {{if $outeritem.kind == 'drive#file' && $outeritem.parents.0.isRoot == 1}}
            <li class="file"><a title="{{$outeritem.title}}" style="cursor:pointer;"  name="{{$outeritem.alternateLink}}" class="openit">{{$outeritem.title|truncate:"30"}}</a></li>
            {{/if}}
            {{/foreach}}-->
			</ol>
		</li>
	</ol>            
<script language="javascript">    
	$(".openit").click(function () {
        var value = $(this).attr("name");
		$("#loadingimage").show();
		$("#loadfile").attr("src", value);
		$("#loadingimage").hide("slow");
    });
</script>