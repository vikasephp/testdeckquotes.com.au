<pre>
<?php
if (strpos(shell_exec('/usr/local/apache/bin/apachectl -l'), 'mod_rewrite') !== false) {
    // mod_rewrite is enabled
    echo "dsdsa";
} else {
    // not enabled
}
?>
</pre>