<?php
/*
<fusedoc fuse="DefaultLayout.cfm">
	<responsibilities>
		I'm just a typical layout file to show how I can wrap my layout around the content in the variable, fusebox.layout.
	</responsibilities>	
	<io>
		<in>
			<string name="$Fusebox['layout']" />
		</in>
	</io>
</fusedoc>
*/

print trim($Fusebox["layout"]);

?>