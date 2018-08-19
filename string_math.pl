use strict;

my $string = $ARGV[0];

#BODMAS

print bodmass_operator($string);


sub bodmass_operator {
    
    my ($string) = @_;
    #Bracket opens
    while ($string =~ m`\(([^(]+)\)`g) {
        my $sub_set = $1;
        my $result = bodmass_operator($sub_set);
        $string =~ s`\(\Q$sub_set\E\)`$result`;
    }
    #Division
    while ($string =~ m`((\d+)\/(\d+))`g) {
        my $sub_set = $1;
        die "division with 0" if $3 == 0;
        my $result = $2 / $3;
        $string =~ s`\Q$sub_set\E`$result`;
    }
    #Multiplication
    while ($string =~ m`((\d+)\*(\d+))`g) {
        my $sub_set = $1;
        my $result = $2 * $3;
        $string =~ s`\Q$sub_set\E`$result`;
    }
    #Addition
    while ($string =~ m`((\d+)\+(\d+))`g) {
        my $sub_set = $1;
        my $result = $2 + $3;
        $string =~ s`\Q$sub_set\E`$result`;
    }
    #Subtraction
    while ($string =~ m`((\d+)\-(\d+))`g) {
        my $sub_set = $1;
        my $result = $2 - $3;
        $string =~ s`\Q$sub_set\E`$result`;
    }
    
    return $string;
}
