<?php
/*
<fusedoc fuse="fbx_Switch.php">
	<responsibilities>
		I am the switch statement that handles the fuseaction, delegating work to various fuses.
	</responsibilities>
	<io>
		<in>
			<string name="$Fusebox['fuseaction']" />
			<string name="$Fusebox['circuit']" />
		</in>
	</io>
</fusedoc>
*/

$current_path = getcwd();

switch($Fusebox["fuseaction"])
{
	default:

		$template = $current_path . '/' . $Fusebox["fuseaction"] . '.tpl';

		if(file_exists($template))
		{
			$fwSubViews['content'] = "file:$template";
		}
        
        $filename = $current_path . '/' . $Fusebox["fuseaction"] . '.php';

		if(file_exists($filename))
		{
			require_once($filename);
		}
		else
		{
			header("Location:404.detail");
			
		}

		break;
}