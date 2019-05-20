$string1 = "dit is een string gemaakt van woorden";
@woorden1 = qw(dit is een array gemaakt van woorden);
@woorden2 = qw(woord1 woord2 woord3 woord4 woord5);
@woorden3 = qw(woord2 woord4 woord5 woord6 woord7);
push @woordenMetDuplicaten, (@woorden2, qw(woord2 woord4));
@cijfers1 = qw(0 1 2 3 4 5 6 7 8 9);
@alfabet = qw(a b c d e f g h i j k l m n o p q r s t u v w x y z);
$float1 = 3.14159265; 
$float2 = 1.41421356;
$float3 = 3.14159266;
$float4 = 1.41421357;
=begin comment
# 1) Hoe kun je een variabele instellen met een default waarde,
# enkel op voorwaarde dat die variabele op dat ogenblik geen waarde heeft?
$a = $b || $c;
# OF
$a = defined($b) ? $b : $c;


# 2) Hoe kun je inhoud van twee variabelen cyclisch omwisselen,
# zonder een intermediaire variabele te gebruiken
($a, $b) = ($b, $a);


# 3) Geef de (numerieke) ascii-waarde weer van een willekeurig karakter.
# Geef de karakterrepresentatie weer van een willekeurige numerieke ascii-waarde.
$char = 'A';
print ord $char;
$char = 65;
print chr $char;


# 4) Bepaal de inverse van een willekeurige, uit woorden samengestelde string:
$string = "dit is een string gemaakt van woorden";
#   volledige string omgekeerd
print scalar reverse($string); #reverse zal enkel string zelf reversen als antwoord scalar moet zijn --> scalar voor reverse
#   individuele karakters van elk woord in omgekeerde zin af te lopen
@woorden = split " ", $string;
foreach (@woorden) {
    print reverse($_)." ";
}
#   woorden in omgekeerde volgorde
print join " ", reverse @woorden;
#of als oneliner
print join " ", reverse split " ", $string;


# 5) Converteer een willekeurige string in uppercase of lowercase
print uc $string;
print lc $string;
print ucfirst $string;
print lcfirst $string;


# 6) Rond een willekeurig floating point getal af op een vooropgezet aantal decimale cijfers (na de komma).
# Dit is ondermeer interessant om de uitvoer leesbaar te maken, en bij problemen met het testen op gelijkheid.
$aantal_cijfers = 3;
printf("%.$aantal_cijfers"."f\n", $float1);


# 7) Hoe kun je best twee willekeurige floating-point getallen met elkaar vergelijken,
# enkel rekening houdend met een specifiek aantal decimale cijfers (na de komma)?
print "$float1 is groter dan $float2: " . (($float1 > $float2) ? "True" : "False") . "\n";

$result = 0;
for($i = 0; $i < 10; $i++) {
    $result += 0.1;
}
print "Result eq to 1: " . ($result eq 1) . "\n";

# Of vergelijken via sprintf
print "$float1 is equal to $float3: " . (sprintf("%.4f", $float1) eq sprintf("%.4f", $float3) ? "True" : "False") . "\n";


# 8) Hoe kun je bewerkingen uitvoeren op een rij gehele getallen tussen X en Y
$X = -5;
$Y = 10;
foreach $current ($X..$Y) {
    # Doe bewerking hier op $current;
    print $current." ";
}


# 9) Genereer random getallen in een vooropgesteld bereik.
# Pas dit toe om een random paswoord te construeren dat uit een vast aantal tekens uit een speciefieke verzameling bestaat.
($begin, $end) = (0, 36);
$length = 10;
@pass = (@alfabet, @cijfers, "A" .. "Z", qw(& @ # !));
for(0..$length) {
    print $pass[int(rand(@pass))];
}


# 10) Maak een programma dat een rij random getallen genereert.
# Zorg ervoor dat , telkens het programma opstart, steeds dezelfde rij geproduceerd wordt.
srand(42);
for(0..10) {
    print int(rand(500))." ";
}


# 11) Hoe kun je binaire ("0b10110", ...), octale ("0755" ...), of hexadecimale ("0x55", ...) representaties van getallen omvormen in hun decimale vorm?
# Perl kan immers enkel onmiddellijk met dergelijke representaties omgaan indien ze als constanten in de programmacode voorkomen.
# Indien de niet-decimale representaties worden ingelezen uit een bestand, of als waarden voorkomen van argumenten of environment variabelen,
# dan is expliciete conversie noodzakelijk.
$bin = 0b10110;
$oct = 0755;
$hex = 0x55;
print "$bin $oct $hex\n";
@data = <DATA>;
#joris-style
print join " ", map(oct, @data);


# 12) indien een functie (stat bijvoorbeeld) een lijst met meerdere elementen als terugkeerwaarde heeft,
# hoe kan je dan slechts met een beperkt aantal van deze elementen expliciet rekening houden, en de andere elementen negeren?

($res1, $res2, $res3, undef, undef, undef, $res7, $res8, undef) = stat "test.txt";
print "$res7\n";
print join "; ",($res1, $res2, $res3, $res7, $res8);


# 13) Bepaal dag, maand en jaar van de datum van vandaag. Bepaal ook het nummer van de week in het jaar.
($day, $mon, $year) = localtime[3,4,5];
print "$day $mon $year\n";
print int($yday/7) + 1; # week van het jaar


# 14) Bepaal datum en tijd van een tijdstip in het verleden of de toekomst
$verleden = localtime(time - 5000);
$toekomst = localtime(time + 5000);
print "$verleden\n$toekomst\n";


# 15) Bereken het aantal dagen verschil tussen twee tijdstippen.
$tijd1 = time - 100000;
$tijd2 = time + 100000;
$verschil = abs($tijd1 - $tijd2);
$dagen = int($verschil/(60*60*24)) + 1;
print $dagen."\n";


# 16) Experimenteer met het initialiseren van array's.
#   1. Via eenvoudige lijsten van strings.
@arr1 = ("string1", "string2", "string3", "string4");
for(@arr1) {print "$_\n"}
#   2. via qw() operator
@arr1 = qw(string1 string2 string3 string4);
for(@arr1) {print "$_\n"}
#   3. Via een invoerbestand waar elementen lijn per lijn zijn opgeslagen
@arr1 = <>;
for(@arr1) {print "$_\n"}


# 17) Schrijf de elementen van een willekeurige array uit op één enkele lijn, waarbij tussen alle opeenvolgende elementen een komma geplaatst wordt,
# en het voegwoord "en" tussen het voorlaatste en het laatste element.
# ook Joris-style
print join(", ",@woorden2[0..$#woorden2-1]), " en ", $woorden2[-1];


# 18) Gebruik de meest efficiënte manier om de grootte van een array te wijzigen. Deze methode is vooral interessant om:
$new_size = 3;
$#woorden2 = $new_size - 1;
print join " ", @woorden2;

# 19) Hoe kun je een array element per element verwerken?
foreach $item (@woorden2) {
    # verwerk item
    print $item;
}


# 20) voeg alle elementen van een array toe aan een andere array
push(@woorden1, @woorden2);
print join " ", @woorden1;


# 21) Verwerk de elementen van een array in omgekeerde volgorde
foreach $item(reverse @woorden1) {
    print $item;
}


# 22) Verwerk de elementen van een array, zoals je dat met pop of shift zou doen, maar nu meerdere elementen ineens
while(@woorden1) {
    ($elem1, $elem2) = splice(@woorden1, 0, 2);
    print "$elem1 $elem2 ";
}


# 23) Verwerk de elementen van een array circulair:
# na het laatste element moeten opnieuw het eerste en alle daaropvolgende elementen telkens opnieuw afgelopen worden.
for(0..$#woorden1) {
    push(@woorden1, $elem = shift(@woorden1));
    #verwerk elem hier
    print "$elem ";
}


# 24) Achterhaal het eerste element van een array, en zijn index, dat aan een specifieke voorwaarde voldoet.
for $index (0..@woorden1) {
    if (@woorden1[$index] eq "array") {
        print "nu is het gelijk $index";
        last;
    }
    print "for loop\n";
}


# 25) Filter een array zodanig dat je alle elementen overhoudt die aan een specifieke voorwaarde voldoen
# lange versie
@result;
foreach(@woorden1) {
    if(length($_) == 3) {
        push @result, $_;
    }
}

# korte versie
undef(@result);
@result = grep { length($_) == 3} @woorden1;
print @result;


# 26) De Perl functie sort sorteert default in ascii volgorde.
# Sorteer een array op de numerieke waarden.
@cijfers1 = reverse @cijfers1;
print "@cijfers1\n";
@cijfers1 = sort { $a <=> $b} @cijfers1;
print "@cijfers1";


# 27 Hoe kun je arrays met niet-benutte elementen, zogenaamde sparse array's,
# implementeren zonder geheugenoverhead?
# gebruik een hash ipv een array --> je kan elke index gebruiken die je wil,
# en enkel deze plaatsen worden opgevuld in geheugen


# 28 Verwijder duplicaten uit een lijst waarden.
# Deze lijst kan bijvoorbeeld bekomen worden door een invoerbestand lijn per lijn in te lezen,
# of door de individuele elementen van een array a priori in te vullen,
# of door de uitvoer van een opdracht te verwerken.

# 1) door invoerbestand lijn per lijn in te lezen
@array = <>;
# 2) door de elementen van een array a priori in te vullen
@array = @woordenMetDuplicaten;
# 3) door de uitvoer van een opdracht te verwerken, weet hier niet direct een voorbeeld van

$/ = "\r\n";
chomp @array;
%hash = map { $_, undef } @array;
@unieke = sort keys %hash;
print "'$_'\n"  for @unieke;


# 29) Bepaal de waarden van elementen die in een eerste array voorkomen, maar niet in een tweede.
# Pas dit toe om lijnen van een bestand te filteren die niet voorkomen in een ander bestand.
%hash = map { $_, undef} @woorden2;
delete @hash{@woorden3};
print (@woorden2_only = keys %hash);


# nu met twee files
open(OLD, "test2.txt");
%hash = map {$_, undef} <OLD>;
open(NEW, "test2_half.txt");
delete @hash{<NEW>};
print keys %hash;


# 30) Veronderstel dat je over twee lijsten beschikt, die elk geen duplikate waarden bevatten.
# Bereken de intersectie-, de unie-, en de verschil-lijsten: elementen die in beide lijsten,
# minstens in één van beide lijsten, of slechts in één van beide lijsten voorkomen.
# hier werken met 
%woorden2Hash = map {$_, $_} @woorden2;
%woorden3Hash = map {$_, $_} @woorden3;

# elementen in beide --> opgelet delete returns de values deleted, not the keys!
# @beide = delete @woorden2Hash{@woorden3};
# print "Beide:\n@beide\n";

# minstens in één van beide
%hash = map {$_, $_} (@woorden2, @woorden3);
@minstens = keys %hash;
print "Minstens 1:\n@minstens\n";

# slechts in één van beide
delete @woorden2Hash{@woorden3};
delete @woorden3Hash{@woorden2};
@enkel2 = keys %woorden2Hash;
@enkel3 = keys %woorden3Hash;
print "Enkel2:\n@enkel2\nEnkel3:\n@enkel3\n";


# 31) Met welke twee functies kun je nagaan of een specifieke waarde optreedt als een index in een Hash?
# exists (zal ook true teruggeven bij undef als waarde) OF defined (zal false terug geven ook bij undef)
%woorden2Hash = map {$_,undef} @woorden2;
print "woord1 exists\n" if exists $woorden2Hash{"woord1"};
print "woord1 defined\n" if defined $woorden2Hash{"woord1"};


# 32) Verwijder een hash element met een specifieke index.
# Hoe kan dit veralgemeend worden tot meerdere elementen ?
%woorden2Hash = map {$_,$_}@woorden2;
delete $woorden2Hash{"woord1"};
print keys %woorden2Hash;
print "\n";
#of meerdere
delete @woorden2Hash{@woorden3};
print keys %woorden2Hash;
print "\n";


# 33) Op welke manieren kun je elk index-waarde paar van een hash element per element verwerken ?
# Hou er rekening mee dat verwerken in gesorteerde volgorde al dan niet gewenst is.
# niet gesorteerd
%hash = map {$_, "value"} @woorden2;
while(($key, $value) = each(%hash)) {
    print "$key => $value\n";
}

#gesorteerd
%hash = map {$_, "value"} @woorden2;
foreach $key (sort keys %hash) {
    print "$key =>".$hash{$key}."\n";
}


# 34) Hoe kun je de inhoud van een hash tonen, waarbij een duidelijk onderscheid
# gemaakt wordt tussen de indices en hun corresponderende waarden.
# Eenvoudige pogingen zoals print"%hash" of print %hash blijken niet te voldoen.
%hash = map{$_ => $_} @woorden2;
while(($key, $value) = each(%hash)) {
    print "$key: $value\n";
}


# 35) Inverteer een hash: construeer een hash met als indices de waarden van de originele hash,
# en als waarden de corresponderende indices.
# Je mag er in deze vraag veronderstellen dat ook de waarden van de originele hash geen duplikaten vertonen.
# Dat probleem zal pas in reeks 4 vraag 9 aangepakt worden.
for (0..4) {
    $hash{@woorden2[$_]} = @woorden3[$_];
}
@indices = keys %hash;
@waarden = values %hash;
for(0..scalar(@indices) - 1) {
    $omgekeerdeHash{@waarden[$_]} = @indices[$_];
}


#of veel korter
%hash = map{"key".$_=>"val".$_} @cijfers1;
while(($key, $value) = each(%hash)) {
    print "$key => $value\n";
}
%omgekeerdeHash = reverse %hash;
print "en nu omgekeerd\n";
while(($key, $value) = each(%omgekeerdeHash)) {
    print "$key => $value\n";
}


# 36) Verwerk de elementen van een hash in een gesorteerde volgorde,
%hash = map{"key".$_ => "val".($#cijfers1 - $_)} @cijfers1;
# hetzij alfabetisch of numeriek gesorteerd op de indices,
foreach $key (sort keys %hash) {
    $value = $hash{$key};
    #do something with the pair
    print "$key => $value\n";
}
# hetzij alfabetisch of numeriek gesorteerd op de waarden.
foreach $key (sort {$hash{$a} cmp $hash{$b}} keys %hash) {
    $value = $hash{$key};
    #do semthing with the pair
    print "$key => $value\n";
}

=end comment
=cut


__DATA__
0b10110
0755
0x55
ditisgeengetal