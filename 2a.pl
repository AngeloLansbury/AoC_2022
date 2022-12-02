while (<STDIN>) {
  last unless ($y, $m) = m/(\S)\s(\S)/;
  $s += ("X1Y2Z3" =~ /$m(\d)/)[0];
  $s += ("XB0YC0ZA0XA3YB3ZC3XC6YA6ZB6" =~ /$m$y(\d)/)[0];
}
print $s;
