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

		$filename = $current_path . '/' . $Fusebox["fuseaction"] . '.php';

		if(file_exists($filename))
		{
			require_once($filename);
		}
		else
		{
			exit('The URL you requested was not found on the server.');
		}

		$template = $current_path . '/' . $Fusebox["fuseaction"] . '.tpl';

		if(file_exists($template))
		{
			$fwSubViews['content'] = "file:$template";
		}

		break;
}