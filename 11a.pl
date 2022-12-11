while (<STDIN>) {
  ($_ = <STDIN>) =~ /: (\d.+)\s$/;
  $i[$m] = [split(/, /, $1)];
  ($_ = <STDIN>) =~ /old(.+)\s$/;
  $r[$m] = $1 eq " * old" ? " ** 2" : $1;
  ($d[$m]) = ($_ = <STDIN>) =~ /by (\d+)\s$/;
  ($t[$m]) = ($_ = <STDIN>) =~ / (\d+)\s$/;
  ($f[$m++]) = ($_ = <STDIN>) =~ / (\d+)\s$/;
  $_ = <STDIN>;
}

for $t (0 .. 19) {
  for $m (0 .. $#r) {
    while ($#{$i[$m]} >= 0) {
      $v[$m]++;
      $w = int(eval(shift(@{$i[$m]}) . $r[$m]) / 3);
      push(@{$i[$w % $d[$m] == 0 ? $t[$m] : $f[$m]]}, $w);
    }
  }
}
@v = sort {$b <=> $a} @v;
print $v[0] * $v[1];
