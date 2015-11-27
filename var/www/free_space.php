<?php
$output = shell_exec('bash /sbin/free_space');
echo "<big><b><pre>$output</pre></b></big>";
?>
