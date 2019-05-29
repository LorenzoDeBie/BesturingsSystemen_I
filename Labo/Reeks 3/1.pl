# Initialiseer twee twee-dimensionale array's, respectievelijk met 2x3 en met 3x2 elementen.
# Interpreteer deze twee-dimensionale array's als matrices, voer de matrix-vermenigvuldiging uit,
# en schrijf het resultaat uit.

@arr1 = ([1,2,3], [4,5,6]);
@arr2 = ([1,2], [3,4], [5,6]);

#dimensies controleren
my $rows1 = @arr1;
my $cols1 = @{$arr1[0]};
my $rows2 = @arr2;
my $cols2 = @{$arr2[0]};
die "Matrices hebben niet de goede dimensies: $cols1 != $rows2" unless ($cols1 == $rows2);

#resultaat bijhouden voor gebruik Dumper
@result = ();

#Om iedere rij van het resultaat te berekenen:
# 1) loop over alle rijen van matrix 1:
# 2) loop over alle kollommen van matrix 2
# 3) bereken som van het product van alle getallen van kollom in matrix 2 met getal in kollom  van rij van matrix 1

for $row1Index (0..$rows1-1) {
    my @resRow = ();
    for $col2Index (0..$cols2-1) {
        $sum = 0;
        for $row2Index (0..$rows2-1) {
            $sum += $arr2[$row2Index][$col2Index] * $arr1[$row1Index][$row2Index];
        }
        print "$sum\t"; 
        push @resRow, $sum;
    }
    print "\n";
    push @result, \@resRow;
}

#om structuur te zien
# use Data::Dumper;
# print Dumper(\@result);