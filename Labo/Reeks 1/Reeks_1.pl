#use strict;
#Oefening 1
#Hoe kun je een variabele instellen met een default waarde,
#enkel op voorwaarde dat die variabele op dat ogenblik geen waarde heeft ?

#use defined funtion to test wether $a has been set
my $b = "hallo";
my $c = "hallo2";
my $a = defined($a) ? $b : $c;

print $a . "\n";


#Oefening 2
#cyclisch omwisselen van twee variabelen zonder extra var
my $var1 = 20;
my $var2 = 30;

#kan ook gebruikt worden voor meerdere variabelen
($var1, $var2) = ($var2, $var1);
print $var1 . $var2 . "\n";

#Oefening 3
#ascii naar nummer en omgekeerd
my $nummer1 = hex(41);
my $char1 = "A";

print chr $nummer1;
print ord $char1;

print "\n";

#Oefening 4
#inverse van een willekeurige string van woorden
my $string_1 = "Dit is een willekeurige string van woorden";
my @array_van_string_1 = split(" ", $string_1);
#a) volledige string reversen
my $string_van_reversed_woorden =reverse $string_1;
print $string_van_reversed_woorden, "\n";
#b) volgorde woorden reversen
my $reversed_volgorde_array_van_string_1 = join(" ", reverse(@array_van_string_1));
print $reversed_volgorde_array_van_string_1;
print "\n";
#c) ieder woord reversen, maar woorden in dezelfde volgorde
foreach(@array_van_string_1) {
    $_ = reverse $_;
}
print join(" ", @array_van_string_1) . "\n";

#Oefening 5
#converteer string naar uppercase of lowercase
#uc lc of \L \U, voor enkel eerste char --> lcfirst ucfirst of \l \u
my $string_2 = "Dit is een willekeurige string van woorden";
my $upper_string_2 = uc $string_2;
my $lower_string_2 = lc $string_2;

print $string_2 . "\n" . $upper_string_2 . "\n" . $lower_string_2 . "\n";

#Oefening 6
#round een float af op vooraf bepaald aantal beduidende cijfers
my $float_1 = 3.14151617181920;
for(0..10) {
    printf("%.${_}f ", $float_1);
}

#Oefening 7
#vergelijk twee floating point nummers op x cijfers na de komma
#mijn oplossing
my $float_2 = 3.14151617181921;
for(1..14) {
    if(abs($float_1 - $float_2) < (1*(10**(-$_)))) {
        print "Ze zijn gelijk\n";
    }
    else {
        print "ze zijn niet gelijk!\n";
    }
}
#cursus oplossing --> maak er string van tot op x plaatsen en compare string --> vragen in de les

#Oefening 8
#Voer een bewerking uit op een rij bestaande uit alle gehele getallen
my $x = 0;
my $y = 10;
for($x..$y) {
    #doe iets met $_
}

#Oefening 9
#Genereer random gehele getallen in een vooropgesteld bereik. 
#maak hiermee een passwoord uit specifieke verzameling tekens
my $begin = 65;
my $end = 65+28;
my @chars_voor_passwoord = ("A" .. "Z", "a".. "z", 0..9, qw(! @ $ % ^ & *));

my $passwoord = join("", @chars_voor_passwoord[map { rand @chars_voor_passwoord } (1..8)]); #map geeft array terug van 8 keer rand @chars_voor_pwd
print $passwoord . "\n";

#Oefening 10
#genereer rij random getallen, die bij iedere run hetzelfde zijn
srand(42);

for(0..5) {
    print int(rand(10)) . "\n";
}

#Oefening 11
#omzetten binair, octaal of hexadecimaal naar decimaal
my $bin = "0b10110";
my $oct = "0755";
my $hex = "0x55";

print oct($bin) . " " . oct($oct) . " " . oct($hex) . "\n";

#Oefening 12
#stel functie returns list --> how to ignore some elements
#functie stat returns list of 13 elements --> create vars i want --> assign them to the list with undef on vars i dont need
my $dev;
my $nlink;
($dev, undef, undef, $nlink) = stat "test.pl";

print $dev . " " . $nlink . "\n";

#Oefening 13
#bepaal dag, maand en jaar van de datum van vandaag, nummer van de week.
(undef, undef, undef, $day, $mon, $year) = localtime();
print "dag: " . $day . " maand: " . $mon . " jaar: " . ($year + 1900) . "\n";

#Oefening 14
#bepaal datum en tijd van toekomst of verleden
$time_verleden = localtime(time() - 2500000);
$time_toekomst = localtime(time() + 24000);

print $time_verleden;
print $time_toekomst;
print "\n";

#Oefening 15
#bepaal aantal dagen tussen twee tijdstippen
$now = time;
$when = $now - (86400 * 25);
$then = $now + (86400 * 25);

$difference = abs($then - $when);

$seconds = $difference % 60;
$difference = ($difference - $seconds) / 60; #dit zal een int zijn
$minutes = $difference % 60;
$difference = ($difference - $minutes) / 60;
$hours = $difference % 24;
$difference = ($difference - $hours) / 24;
$days = $difference;

print "Tussen de twee tijdstippen zitten $days dagen, $hours uren, $minutes minuten en $seconds seconden.\n";


