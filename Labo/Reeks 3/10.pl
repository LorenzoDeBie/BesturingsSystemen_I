=begin opgave
Het is eenvoudig om met een hash hiërarchische verbanden met een boomstructuur tussen entiteiten te vertolken:
 het volstaat om voor elke kind-ouder koppel, een element in de hash toe te voegen,
 met als index de kind-entiteit, en als waarde de ouder-entiteit.
In dit adjacency model is het niet alleen eenvoudig om van een kind-entiteit de ouder-entiteit te bepalen,
 maar ook om van een ouder-entiteit de kinderen te achterhalen. 
Door als waarden in de hash anonieme array's te gebruiken,
 kun je ook verwijzen naar meerdere kind-entiteiten. 
Pas dit model toe om de staatsstructuur van België voor te stellen. 

Je kan van deze techniek ook gebruik maken om in een verzameling include-bestanden achtereenvolgens:
    der bestand een lijst te construeren van bestanden die dit bestand includeren,
    de bestanden te achterhalen die wel andere bestanden includeren,
     maar waarnaar niet verwezen wordt vanuit andere include-bestanden.
=end opgave
=cut

@ARGV = ("regios.csv");
<>; #eerste lijn skippen
while(<>) {
    chomp;
    ($regio, $ouder, $bevolking, $oppervlakte) = split(';');
    $staatsstructuur{$regio} = {
        regio       => $regio,
        ouder       => $staatsstructuur{$ouder},
        kinderen    => [],
        niveau      => 0,
        bevolking   => $bevolking,
        oppervlakte => $oppervlakte
    };
    push @{$staatsstructuur{$ouder}->{kinderen}}, $staatsstructuur{$regio};
    $refOuder = $staatsstructuur{$ouder};
    $staatsstructuur{$regio}->{niveau} = $refOuder->{niveau} + 1;
    next unless $bevolking;
    while($refOuder) {
        $refOuder->{bevolking}  += $bevolking;
        $refOuder->{oppervlakte}+= $oppervlakte;
        $refOuder = $refOuder->{ouder};
    }
}

print "Belgie (niveau = ".${$staatsstructuur{"Belgie"}}{niveau}.", oppervlakte = ".
${$staatsstructuur{"Belgie"}}{oppervlakte}.", bevolking = ".${$staatsstructuur{"Belgie"}}{bevolking}."):\n";
foreach $gewest_ref (@{$staatsstructuur{"Belgie"}->{kinderen}}) {
    $gewest = $gewest_ref->{regio};
    print "\t$gewest:\n";
    foreach $prov_ref (@{$gewest_ref->{kinderen}}) {
        $prov = $prov_ref->{regio};
        print "\t\t$prov:\n";
        foreach $arr_ref (@{$prov_ref->{kinderen}}) {
            $arr = $arr_ref->{regio};
            print "\t\t\t$arr:\n";
            foreach $stad_ref (@{$arr_ref->{kinderen}}) {
                $stad = $stad_ref->{regio};
                print "\t\t\t\t$stad\n";
            }
        }
    }
}