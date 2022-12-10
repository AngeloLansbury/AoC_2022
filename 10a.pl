@s = (20, 60, 100, 140, 180, 220);
$x = 1;
while (<STDIN>) {
  last if $#s < 0;
  $a = /addx (\-?\d+)/ ? $1 : 0;
  if (($t += $a ? 2 : 1) >= $s[0]) {
    $s += shift(@s) * $x;
  }
  $x += $a;
}
print $s
