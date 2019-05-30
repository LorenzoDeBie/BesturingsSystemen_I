=begin opgave
Op welke verschillende manieren kun je een scalaire variabele invullen met een referentie naar een hash.
=cut
%hash = (
    "index1" => "waarde1",
    "index2" => "waarde2",
    "index3" => "waarde3"
);

$manier1 = \%hash;
$manier2 = { "één" => 1, "twee" => 2};
$manier3 = {%hash};

#Hoe kun je via deze referentie:
#een specifiek element van de hash aanspreken ?
print ${$manier1}{"index1"};print"\n";
#een slice van de hash aanspreken ?
print join " ",@{$manier1}{"index1", "index2"}; print"\n";
#alle indices bekomen ?
print join " ",keys %{$manier1}; print "\n";
#alle index-waarde koppels één voor één verwerken ?
while (($index, $value) = each(%$manier3)) {
    print "$index => $value\n";
}