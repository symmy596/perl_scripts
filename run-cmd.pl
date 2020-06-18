#!/usr/bin/perl

$path=0;
$target='.';
$start_arg=0;
$cmd='';

$narg=@ARGV;

if($ARGV[0] =~ /^-/)
{
     if($ARGV[0] =~ /p/)
     {
        $path=1;
        $target=$ARGV[1];
        $start_arg=2;
     }

}

for (my $i=$start_arg;$i<=$narg;$i++)
{
   $cmd.=$ARGV[$i];
   $cmd.=' ';
}


chdir("$target") || die "cannot find $target";

@dir = <*>;

$di=0;
while($dir[$di])
{
  $res=chdir("$dir[$di]") ;
  if ($res)
  {
    print "$dir[$di]        \n";
     system("$cmd");
     chdir("..");
  }

  $di++;
}


