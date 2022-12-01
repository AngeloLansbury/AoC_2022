while (<STDIN>) {
  $c += $_;
  unless (/\d/) {
    push(@v, $c);
    $c = 0;
  }
}
@v = (reverse sort {$a<=>$b} (@v, $c))[0..2];
print eval join "+", @v;
