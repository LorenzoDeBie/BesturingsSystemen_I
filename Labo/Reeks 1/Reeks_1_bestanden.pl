# vraag 40
# Hoe kun je de inputgegevens va neen programma samen met de broncode in één enkel bestand bundelen?
# door gebruikt te maken van __DATA__


# vraag 41
# Schrijf het skelet van een filterprogramma.
# Indien op de opdrachtlijn parameters worden megegeven, dan moeten deze beschouwd worden als de namen van de inputbestanden.
# Indien er geen parameters zijn, dan moet het programma zijn invoer van de standaard invoer halen.
# Een parameter "-" duidt aan dat de standaard invoer als één van de inputkanalen moet verwerkt worden. Een parameter van de vorm "opdracht |"
# laat toe om de uitvoer van een programma als invoer te beschouwen.

# while(<>) {
#     print $_;
# }


# vraag 42
# verander bestand mbv intermediair hulpbestand
# $old_filename = "test.txt";
# $new_filename = "temp.txt";
# open(OLD, "<", $old_filename)               or die "can't open $old_filename: $!";
# open(NEW, ">", $new_filename)               or die "can't open $new_filename: $!";
# while(<OLD>) {
#     #change $_, then
#     print NEW "aangepaste lijn: $_"         or die "can't write to $new_filename: $!";
# }
# close(OLD)                                  or die "can't close $old_filename: $!";
# close(NEW)                                  or die "can't close $new_filename: $!";
# rename($old_filename, "$old_filename.orig") or die "can't rename $old_filename: $!";
# rename($new_filename, $old_filename)        or die "can't rename $new_filename: $!";


# vraag 43
# verander bestand, maar deze keer zonder intermediair bestand
# $^I = ".orig";
# while(<>) {
#     print "aangepaste lijn: $_";
# }

# vraag 44
# tel het aantal lijnen in een bestand, tel ook het aantal blokken (gescheiden door een lege lijn)
