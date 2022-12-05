@s = ([],[],[],[],[],[],[],[],[],[]);
while (<STDIN>) {
  last if /\d/;
  for $c (0 .. 8) {
    $x = substr($_, 1 + $c * 4, 1);
    unshift(@{$s[$c + 1]}, $x) if $x ne ' ';
  }
}
$_ = <STDIN>;
while (<STDIN>) {
  /move (\d+) from (\d+) to (\d+)/;
  push(@{$s[$3]}, splice(@{$s[$2]}, -$1));
}
for (1 .. 9) {
  print pop(@{$s[$_]});
}
