@c = split(//, $l = <STDIN>);
@b = splice(@c, 0, 4);
while (1) {
  if ($b[0] eq $b[1] ||
      $b[0] eq $b[2] ||
      $b[0] eq $b[3] ||
      $b[1] eq $b[2] ||
      $b[1] eq $b[3] ||
      $b[2] eq $b[3]) {
    shift(@b);
    push(@b, shift(@c));
  }
  else {
    last;
  }
}
print length($l) - $#c - 1;
