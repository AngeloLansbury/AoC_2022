$a .= $_ for 'a' .. 'z';
$a .= uc($a);
while (chop($_ = <STDIN>)) {
  for $v (split(//, substr($_, 0, length($_) / 2))) {
    $v{$v} = 1;
  }
  for $v (split(//, substr($_, length($_) / 2))) {
    if ($v{$v}) {
      $s += 1 + index($a, $v);
      last;
    }
  }
  %v = ();
}
print $s;
