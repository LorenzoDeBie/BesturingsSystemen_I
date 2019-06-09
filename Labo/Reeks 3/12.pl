=begin opgave
Op het examen van het vak Computernetwerken I wordt dikwijls volgende vraag gesteld:
Een ISP is eigenaar van een IP supernetwerkadresbereik ... .
 Een aantal van zijn klanten, die respectievelijk subnetwerkadresbereiken ...
 voor hun intranet benutten, sluiten zich aan bij een andere ISP, 
 zonder hun infrastructuur te hernummeren. 
Met welke, zo klein mogelijke verzameling supernetwerkadressen, in prefixlengtesyntax,
 moeten de routingtabellen van het Internet verwijzen naar het resterende adresbereik van de ISP ? 
Deze supernetwerkadressen mogen niet overlappen, noch onderling,
 noch met de subnetwerkadresbereiken van de klanten.
Ontwikkel een script dat dit probleem behandelt. 
Het script verwacht als opeenvolgende argumenten eerst het (enige) supernetwerkadres van de ISP,
 en vervolgens een willekeurig aantal subnetwerkadressen van muterende klanten, bijvoorbeeld:
 200.25/16 200.25.16/21
Controleer dat de prefixlengtes van elk van de argumenten aan de vereiste minimumwaarden voldoen. 
Het script moet als uitvoer de op adres gesorteerde verzameling overblijvende supernetwerkadressen produceren:
200.25/20 200.25.24/21 200.25.32/19 200.25.64/18 200.25.128/17
Wordt het script met volgende parameters opgeroepen,
141.96/12 141.99.88/23 141.99.160/21 141.103.66/27
dan moet volgende verzameling overblijvende supernetwerkadressen geproduceerd worden:
141.96/15 141.98/16 141.99/18 141.99.64/20 141.99.80/21 141.99.90/23 141.99.92/22 141.99.96/19 141.99.128/19 141.99.168/21 141.99.176/20 141.99.192/18 141.100/15 141.102/16 141.103/18 141.103.64/23 141.103.66.32/27 141.103.66.64/26 141.103.66.128/25 141.103.67/24 141.103.68/22 141.103.72/21 141.103.80/20 141.103.96/19 141.103.128/17 141.104/13
=end opgave
=cut

use Data::Dumper; # for debugging purposes
$DEBUG = 0;

@ARGV = qw(141.96/12 141.99.88/23 141.99.160/21 141.103.66/27);

# Voorbereiding: Voor iedere prefix de lengte weten en van iedere lengte de prefix kunnen opzoeken
$aantal_adressen = 1/2;
for (reverse 0..32) {
    $aantal_adressen *= 2;
    $aantal[$_] = $aantal_adressen;
    $lengte{$aantal_adressen} = $_;
}
# debug info
print Dumper(\@aantal),"\n",Dumper(\%lengte),"\n" if $DEBUG;

$error = 0;
# Stap 1: input controlleren en eerste adres omzetten naar decimaal en grootte bepalen
for $adres (@ARGV) {
    # adres splitten op iedere mogelijke '.' of '/' => ik krijg een array met ieder nummer van ip en als laatste prefix voor lengte
    my @ip = split "[.\/]",$adres;
    splice @ip,@ip-1,0,0 while (@ip < 5); # 0 toevoegen zolang ik geen 4 cijfers heb voor ip adres
    # debug info
    print Dumper(\@ip) if $DEBUG;
    # omzetten naar een decimaal getal en grootte;
    my $start_adres_decimaal = 0;
    $start_adres_decimaal = $start_adres_decimaal * 256 + $ip[$_] for (0..3);
    # debug info
    print Dumper(\$start_adres_decimaal) if $DEBUG;
    # controlleren of er nog 1 bits zijn na de prefix --> adres is verkeerd
    if($start_adres_decimaal %$aantal[$ip[4]]) {
        $ip[4]++ while($start_adres_decimaal % $aantal[$ip[4]]);
        print "$adres heeft min /$ip[4] nodig!\n" if $DEBUG;
        $error++;
    }
    push @V,[$start_adres_decimaal, $aantal[$ip[4]]] unless @V;
}
exit(0) if $error;

print "Stap 2\n" if $DEBUG;
# adres ISP skippen
shift @ARGV;
# Stap 2: alle subnetwerken verwijderen uit supernetwerk (en het supernetwerk dus splitsen)
while (@ARGV) {
    $sub = $ARGV[0];
    #zelfde als hierboven
    my @ip = split "[.\/]",$sub;
    splice @ip,@ip-1,0,0 while (@ip < 5);
    my $start_adres_decimaal = 0;
    $start_adres_decimaal = $start_adres_decimaal * 256 + $ip[$_] for (0..3);
    my $index = -1;
    my $found = 0;
    for $sup_ref (@V) {
        $index++;
        #kijken of het startadres in het supernetwerk ligt
        if($$sup_ref[0] <= $start_adres_decimaal && $$sup_ref[0] + $$sup_ref[1] > $start_adres_decimaal) {
            $found = 1;
            print "Supernet van $sub ($start_adres_decimaal) is $$sup_ref[0]\n" if $DEBUG;
            # als het supernetwerk groter is dan het subnetwerk --> opsplitsen
            if($$sup_ref[1] > $aantal[$ip[4]]) {
                $halve_grootte = $$sup_ref[1]/2;
                splice(@V, $index, 1, ([$$sup_ref[0], $halve_grootte],[$$sup_ref[0] + $halve_grootte, $halve_grootte]));
                print "Supernetwerk van $sub gesplitst!\n" if $DEBUG;
            }
            # als het even groot is, is het supernetwerk gelijk aan het subnetwerk
            elsif($$sup_ref[1] == $aantal[$ip[4]]) {
                print "Supernetwerk van $sub ($start_adres_decimaal) is gelijk aan $$sup_ref[0]\n" if $DEBUG;
                splice(@V,$index, 1);
                shift @ARGV;
            }
            last;
        }
    }
    #indien het supernet niet gevonden is, is het subnetwerk geen deel van het netwerk van de ISP --> negeren
    shift @ARGV unless $found;
}
print Dumper(\@V) if $DEBUG;

# Stap 3: Startadressen in decimaal formaat en lengtes veranderen naar prefixnotatie
for $net_ref (@V) {
    my @ip = ();
    my $start = $$net_ref[0];
    for(reverse 0..3) {
        $ip[$_] = $start % 256;
        $start /= 256;
    }
    pop @ip while(@ip > 1 && !$ip[-1]);
    push @ip, $lengte{$$net_ref[1]};
    print join("/", (join(".", @ip[0..(@ip-2)]), $ip[@ip - 1])),"\n";
}