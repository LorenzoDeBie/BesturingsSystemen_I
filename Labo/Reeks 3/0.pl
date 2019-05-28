#Inverteer de hashes, zoals tijdens de inleidende les werd gedemonstreerd.
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

# foreach $provincie ( keys %gewest ) {
#     push @{ $structuur{ $gewest{$provincie} } }, $provincie;
# }
while ( ( $stad, $provincie ) = each %provincie ) {
    $gewest = $gewest{$provincie};
    push @{ $structuur{$gewest}->{$provincie} }, $stad;
}

print Dumper( \%structuur );

# # print ? provincies{"Vlaanderen"}

# # %provincies = ();
# while ( ( $provincie, $gewest ) = each %gewest ) {

#     # $provincies{$gewest} = [] unless $provincies{$gewest};
#     push @{ $provincies{$gewest} }, $provincie;
# }

# # gecommente lijnen mogen weg want perl doet aan autovivivicatie

# # for $provincie (keys %provincies) {
# #     print "\n$provincie:\n\t\t";
# #     print join "
# #         ",@{$provincies{$provincie}};
# # }

# # print ? steden{"Vlaanderen"} ? {"West-Vlaanderen"} ?
# # %steden = ();
# # while (($stad,$provincie) = each %provincie) {
# #     $gewest = $gewest{$provincie};
# #     $steden{$gewest} = {} unless $steden{$gewest};
# #     $steden{$gewest}->{$stad} = [] unless $steden{$gewest}->{$stad};
# #     push
# # }

# # print ? steden{"Vlaanderen"} ?

# print join "
# ", sort map { @{$_} } values %{ $steden{"Vlaanderen"} };             
