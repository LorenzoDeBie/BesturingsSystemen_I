=begin opgave
Inverteer de hashes, zoals tijdens de inleidende les werd gedemonstreerd.
=end opgave
=cut
%gewest=( "Antwerpen"      => "Vlaanderen", "Henegouwen"   => "Wallonie",
          "Limburg"        => "Vlaanderen", "Namen"        => "Wallonie",
          "Oost-Vlaanderen"=> "Vlaanderen", "Luik"         => "Wallonie",
          "Vlaams-Brabant" => "Vlaanderen", "Luxemburg"    => "Wallonie",
          "West-Vlaanderen"=> "Vlaanderen", "Waals-Brabant"=> "Wallonie");

%provincie=( "Aalst"       => "Oost-Vlaanderen", "Brugge"  => "West-Vlaanderen",
             "Dendermonde" => "Oost-Vlaanderen", "Ieper"   => "West-Vlaanderen",
             "Eeklo"       => "Oost-Vlaanderen", "Oostende"=> "West-Vlaanderen",
             "Oudenaarde"  => "Oost-Vlaanderen", "Kortrijk"=> "West-Vlaanderen",
             "Sint-Niklaas"=> "Oost-Vlaanderen", "Gent"    => "Oost-Vlaanderen",
             "Halle"       => "Vlaams-Brabant" , "Genk"    => "Limburg"        ,
             "Leuven"      => "Vlaams-Brabant" , "Hasselt" => "Limburg"        ,
             "Vilvoorde"   => "Vlaams-Brabant" , "Tongeren"=> "Limburg"        );
             
use Data::Dumper;

# print ? provincies{"Vlaanderen"} => een hash maken met alle provincies per gewest
foreach $provincie ( keys %gewest ) {
    #provincies is een hash
    #$gewest{$provincie} is een string die het gewest voorstelt
    #$provincies{ $gewest{$provincie} } zorgt er voor dat $gewest{$provincie} een key wordt van de hash
    #de @{ $provincies{ $gewest{$provincie} } } zorgt er voor dat de value van de key een ref naar een array wordt
    # we dereferencen deze ref ook direct en push voegt de provincie toe aan de array
    push @{ $provincies{ $gewest{$provincie} } }, $provincie;
}

# print ? provincies{"Vlaanderen"} wordt:
print join " ", @{$provincies{"Vlaanderen"}};
print "\n";
#$ voor provincies want provincies{"Vlannderen"} is een reference, @ voor de {} want het is een ref naar een array

# print ? steden{"Vlaanderen"} ? {"West-Vlaanderen"} ? => een hash maken met per gewest een reference naar een hash met provincies als key en values die elk naar een array van steden wijzen
while (($stad, $provincie) = each( %provincie)) {
    # we pushen een stad naar een array dus @{} want we hebben enkel ref naar array
    # $gewest{$provincie} is de naam van het gewest van de provincie
    # $steden = een hash => met $steden { $gewest{$provincie} } hebben we het dus op een value van de hash $steden
    # met $steden{ $gewest{$provincie} }{$provincie} zorgen we er voor dat perl van de values automatisch een ref maakt naar een hash
    # de value van deze hash moet dan een array worden ==> @{} zorgt daarvoor
    #we pushen $stad naar de array die dus 2 levels diep zit in de hash
    push @{ $steden{ $gewest{$provincie} }{$provincie} }, $stad;
}

print join " ", @{ $steden{"Vlaanderen"}->{"West-Vlaanderen"} };
print "\n";
#uncomment dit om de structuur te zien:
#print Dumper(\%steden);

# print ? steden{"Vlaanderen"} ?
# values %{ $steden{"Vlaanderen"} } is een array van references naar arrays
# map maakt een list met alle arrays na elkaar (geen references meer) --> 1 grote array
# join zet deze allemaal samen
print join "
", map { @{$_} } values %{ $steden{"Vlaanderen"} };
print "\n";