$hx = $hy = $tx = $ty = 1000;
$v[$tx][$ty] = $t = 1;

for (<STDIN>) {
  ($d, $l) = /(\S+) (\S+)/;
  while ($l--) {
    if ($d eq "R" && $hx++ > $tx) {
      $tx++;
      $ty = $hy;
    }
    elsif ($d eq "L" && $hx-- < $tx) {
      $tx--;
      $ty = $hy;
    }
    elsif ($d eq "U" && $hy++ > $ty) {
      $ty++;
      $tx = $hx;
    }
    elsif ($d eq "D" && $hy-- < $ty) {
      $ty--;
      $tx = $hx;
    }
    $t += $v[$tx][$ty] = 1 unless $v[$tx][$ty];
  }
}
print $t;
