@x = @y = (1000) x 10;
$v[$x[9]][$y[9]] = $t = 1;

for (<STDIN>) {
  ($d, $l) = /(\S+) (\S+)/;
  while ($l--) {
    if    ($d eq "R") { $x[0]++ }
    elsif ($d eq "L") { $x[0]-- }
    elsif ($d eq "U") { $y[0]++ }
    elsif ($d eq "D") { $y[0]-- }
    &follow(1);
    $t += $v[$x[9]][$y[9]] = 1 unless $v[$x[9]][$y[9]];
  }
}
print $t;

sub follow {
  $dx = $x[$_[0] - 1] - $x[$_[0]];
  $dy = $y[$_[0] - 1] - $y[$_[0]];
  if ($dx == 2) {
    $x[$_[0]]++;
    if ($dy > 0)    { $y[$_[0]]++ }
    elsif ($dy < 0) { $y[$_[0]]-- }
  }
  elsif ($dx == -2) {
    $x[$_[0]]--;
    if ($dy > 0)    { $y[$_[0]]++ }
    elsif ($dy < 0) { $y[$_[0]]-- }
  }
  elsif ($dy == 2) {
    $y[$_[0]]++;
    $x[$_[0]] += $dx;
  }
  elsif ($dy == -2) {
    $y[$_[0]]--;
    $x[$_[0]] += $dx;
  }
  else { return; }
  &follow($_[0] + 1) if $_[0] < 9;
}
