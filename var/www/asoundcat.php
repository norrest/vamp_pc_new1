<?php
$output = shell_exec('bash /sbin/asoundcat');
echo "<pre>$output</pre>";
?>
