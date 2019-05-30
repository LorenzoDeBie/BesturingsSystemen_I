=begin opgave
Stel een nieuwe hash samen op basis van meerdere bestaande hashes.
Hou, in tegenstelling tot reeks 2 vraag 37, nu wel rekening met indices die in meerdere originele hashes voorkomen.
Probeer ook het herhalen van de while-lus, voor elk van de hashes, van de oorspronkelijke oplossing te vermijden.
=end opgave
=cut

%hash1 = (
    "key1" => "1waarde1",
    "key2" => "1waarde2",
    "key3" => "1waarde3"
);
%hash2 = (
    "key1" => "2waarde1",
    "key3" => "2waarde3",
    "key4" => "2waarde4",
);

#ik kan maar 1 hash meegeven met each() --> lijst van references naar hash maken en één per keer doen
foreach $hashRef (\%hash1, \%hash2) {
    while(($key, $value) = each(%$hashRef)) {
        #als ik zelf wil beslissen wat te doen met duplicaten
        #if(exists $result{$key}) {}
        push @{$result{$key}}, $value;
        #oplossing van intranet, dit slaat wel enkel de laatste waarde op per key
        #$result{$key} = $value;
    }
}

use Data::Dumper;
print Dumper(\%result);