while (<STDIN>) {
  $m = $c if ($c += $_) > $m;
  $c = 0 unless /\d/;
}
print $m;
