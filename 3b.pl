$a .= $_ for 'a' .. 'z';
$a .= uc($a);
while (chop($_ = <STDIN>)) {
  for $c (1,2,4) {
    for $v (split(//)) {
      $v{$v} |= $c;
    }
    chop($_ = <STDIN>) unless $c == 4;
  }
  for $v (keys %v) {
    if ($v{$v} == 7) {
      $s += 1 + index($a, $v);
      last;
    }
  }
  %v = ();
}
print $s;
