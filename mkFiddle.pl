#!/opt/local/bin/perl

use strict;
use warnings;

use Data::Dumper;
use YAML::XS qw/LoadFile/;
use File::Slurp;

my $d = LoadFile('Demo/demo.details') or die $!;

print <<EOT;
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  <title>$d->{name}</title>
  
  <script type='text/javascript' src='http://jsfiddle.net/js/lib/dummy.js'></script>
  
  
  
  
  <link rel="stylesheet" type="text/css" href="http://jsfiddle.net/css/result-light.css">
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

my $css = read_file('Demo/demo.css');
my $js = read_file('Demo/demo.js');
my $html = read_file('Demo/demo.html');

print <<EOT;
$css
<style>


  </style>
  


<script type='text/javascript'>//<![CDATA[ 

$js

//]]>  

</script>


</head>
<body>
  $html
</div>

  
</body>


</html>

EOT
