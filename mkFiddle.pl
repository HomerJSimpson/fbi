#!/opt/local/bin/perl

use strict;
use warnings;

use Data::Dumper;
use YAML::XS qw/LoadFile/;
use File::Slurp;

my $d = LoadFile('Demo/demo.details') or die $!;

print Dumper $d;

print <<EOT;
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  <title>$d->{name}</title>
  
  <script type='text/javascript' src='/js/lib/dummy.js'></script>
  
  
  
  
  <link rel="stylesheet" type="text/css" href="/css/result-light.css">
EOT
  
foreach my $css (@{$d->{resources}}) {
	if($css =~ /\.css$/) {
		printf("  <link rel=\"stylesheet\" type=\"text/css\" href=\"%s\">\n", $css);
	} else {
		printf("  <script type='text/javascript' src='%s'></script>\n", $css);
	}
}

print <<EOT;
  <style type='text/css'>
    /* your custom CSS \*/
EOT

print <<EOT;
</style>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="default">
<style>


  </style>
  


<script type='text/javascript'>//<![CDATA[ 

$(function() {
});

//]]>  

</script>


</head>
<body>
  <div id="main">
</div>

  
</body>


</html>

EOT
