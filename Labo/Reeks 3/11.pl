=begin opgave
Op welke manier kun je best een record datatype creëeren, bestaande uit diverse velden ?
Geef aan hoe je een dergelijke structuur kunt initialiseren en gebruiken. 
Geef ondermeer aan hoe je de toegang via een specifiek veld kunt versnellen, 
 en hoe je het eenvoudigst records kunt selecteren die aan een bepaald criterium moeten voldoen.
=end opgave
=cut

# Gebruik een anonieme hash om te initialiseren
$record = {
    KEY1 => "VAL1",
    KEY2 => "VAL2",
    KEY3 => ["3VAL1", "3VAL2", "3VAL3"]
};

# Een specifiek veld opvragen
#print "Key1 van het record heeft value: $record->{KEY1}\n";

# Om gemakkelijk te kunnen gebruiken kunnen we een nieuwe hash gebruiken met als key VAL1 en als value een ref naar het record
%byVAL1 = (
    VAL1 => $record
);
# Stel dat we een csv file hebben met allemaal records kunnen we dan aan ieder record door de eerste value van dit record
@ARGV = ("store.csv");
$keysString = <>;
chomp $keysString; #\n wegdoen van laatste lijn (Let erop dat het LF line endings zijn ipv CRLF)
@keys = split ",",$keysString;
while(<>) {
    chomp;
    @values = split ",",$_;
    scalar @keys == scalar @values or die "Aantal data is niet gelijk aan aantal keys!\n";
    my %employee = ();
    for(my $i = 0; $i < scalar @keys; $i++) {
        $employee{$keys[$i]} = $values[$i];
    }
    $store{$employee{"Emp ID"}} = \%employee;
}
#store bevat nu een ref naar een hash voor iedere Emp ID
print_employee($store{"677509"});

sub print_employee() {
    my %employee = %{@_[0]};
    foreach $key (keys %employee) {
        print "$key => $employee{$key}\n";
    }
}