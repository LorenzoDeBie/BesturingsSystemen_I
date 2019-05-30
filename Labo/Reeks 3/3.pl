=begin opgave
# Gebruik hashes van array's om aan elke index van de hash een lijst van waarden te associëren.
=end opgave
=cut

#hash maken op voorhand is optioneel (door autovivication wordt de hash, de reference en de array vanzelf gemaakt)
%hash = (
    "index1" => [qw(1waarde1 1waarde2 1waarde3 1waarde4)],
    "index2" => [qw(2waarde1 2waarde2 2waarde3 2waarde4)],
    "index3" => [qw(3waarde1 3waarde2 3waarde3 3waarde4)]
);


# Hoe kun je aan de lijst van een specifieke index een waarde toevoegen ?
#hier kan ik geen verkorte notatie (@$hash{"index2"}) gebruiken want wordt geïnterpreteerd als
push @{$hash{"index2"}}, ("nieuweWaarde", "nieuweWaarde2");
# Hoe kun je de volledige lijst van waarden voor elke index tonen ?
foreach(keys %hash) {
    print join " ", @{$hash{"index2"}}; print "\n";
}
