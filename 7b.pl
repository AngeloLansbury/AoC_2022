$_ = <STDIN>;
$t = &parse_dir("") + 30000000 - ($c = 70000000);
for (values %s) {
  $c = $_ if $_ >= $t && $_ < $c;
}
print $c;

sub parse_dir {
  my $s;
  while (<STDIN>) {
    if (/^\$ cd \.\./) {
      last;
    }
    elsif (/^(\d+)/) {
      $s += $1;
    }
    elsif (/^\$ cd (\S+)/) {
      my $d = $1;
      $s += $s{"$_[0]/$d"} += &parse_dir("$_[0]/$d");
    }
  }
  $s
}
