while (<STDIN>) {
  last unless ($y, $m) = m/(\S)\s(\S)/;
  $s += ("X0Y3Z6" =~ /$m(\d)/)[0];
  $s += ("AX3AY1AZ2BX1BY2BZ3CX2CY3CZ1" =~ /$y$m(\d)/)[0];
}
print $s;
