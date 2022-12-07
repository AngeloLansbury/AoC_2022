$_ = <STDIN>;
$s{"/"} += &parse_dir("");
for (values %s) {
  $t += $_ if $_ <= 100000;
}
print $t;

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
