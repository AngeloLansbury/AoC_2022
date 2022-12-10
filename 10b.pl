$x++;
while (<STDIN>) {
  $v = /addx (\-?\d+)/ ? $1 : 0;
  &cyc if $v;
  &cyc;
  $x += $v;
}

sub cyc {
  print $t % 40 >= $x - 1 && $t % 40 <= $x + 1 ? "#" : ".";
  print "\n" if ++$t % 40 == 0;
}
