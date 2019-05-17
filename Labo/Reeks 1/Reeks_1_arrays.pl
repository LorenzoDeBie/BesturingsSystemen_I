# Oefening 16
# experimenteer met het intit van arrays (normaal, qw en invoerbestand)
@array = ("String1", "String2", "String3","String4DieLangerIs");
@array2 = qw( String1 String2 String3 string4 string5 string6 string7 string8 string9 string0);
# @array3 = <>;

# for(@array) {
#     print $_ . "\n";
# }

# for(@array2) {
#     print $_ . "\n";
# }

# for(@array3) {
#     print $_;
# }

#Oefening 17
# Schrijf de elementen van een willekeurige array uit op één enkele lijn met komma's tussen elk element behalve het laatste met en
# print @array[0];
# for(1..(@array-1)) {
#     if($_==(@array-1)){
#         print " en @array[$_]";
#     }
#     else {
#         print ", @array[$_]";
#     }
# }

#betere oplossing --> wel opletten met haakjes want join en print gebruiken zoveel argumenten als ze kunnen
# print join(", ",@array[0..$#array-1])," en ",$array[-1];

#Oefening 18
# Gebruik de meest efficiënte manier om de grootte van een array te wijzigen
# @array[5] = "String6"; #dit vergroot de array
# $#array = 1; #dit veranderd gewoon de size van de array

# for(@array) {
#     if(defined $_) {
#         print $_ . "\n";
#     }
#     else {
#         print "hier is niets\n";
#     }
# }

#Oefening 19
# Verwerk een array element per element
# for = foreach
# for (@array) {
#     #verwerk dit element met $_
#     print $_;
# }

# #dit zorgt er voor dat je $_ niet moet gebruiken
# for $item (@array) {
#     print $item;
# }

#Oefening 20
# append alle elementen van een array toe aan een andere
# push(@array, ("string4", "string5"));

# print join " ",@array;

#Oefening 21
# verwerk een array in omgekeerde volgorde
# for(reverse @array) {
#     print $_;
# }

#Oefening 22
# Verwerk de elementen van een array zoals met pop of shift maar meerdere tegelijk
# while(@array2) {
#     @minArray = splice @array2,0,2; # zoals pop (achteraan wegdoen)
#     print "nieuwe iteratie: " . (join " ",@minArray) . "\n"; 
# }

# while(@array2) {
#     @minArray = splice @array2,-2; # zoals shift (vooraan wegdoen)
#     print "nieuwe iteratie: " . (join " ",@minArray) . "\n"; 
# }

#Oefening 23
# Verwerk de elementen van een array circulair
# for(0..(2 * scalar @array)) {
#     print "$_: ";
#     print @array[0] . "\n";
#     push(@array, $var =  shift(@array));
#     print join(" ", @array) . "\n";
# }

# # omgekeerd
# print "nu omgekeerd\n";

# for(0..(2 * scalar @array)) {
#     print "$_: ";
#     print @array[0] . "\n";
#     unshift(@array, $var = pop(@array));
#     print join(" ", @array) . "\n";
# }

#Oefening 24
# Vindt eerste elemente en index van element uit array die aan voorwaarde voldoet
# door middel van grep --> inefficiënt
# @goede_waardes = grep {length($_) > 7} @array;
# print @goede_waardes[0];

# door middel van een for loop met last
# for $index (0..$#array) {
#     if(length(@array[$index]) > 7) {
#         #hier heb ik mijn eerste element gevonden
#         print @array[$index];
#         last;
#     }
# }

#Oefening 25
# Filter een array zodanig dat je alle elementen overhoudt die aan een specifieke waarde voldoen
# door middel van grep
# @goede_waardes = grep {length($_) > 7} @array;
# print join " ",@goede_waardes;

#Oefening 26
# The default sort function is cmp, string comparison,
# which would sort (1, 2, 10) into (1, 10, 2) . <=> ,
# used above, is the numerical comparison operator.

@getallen = (1,2,10);
@sorted = sort @getallen;
@numSorted = sort {$a <=> $b} @getallen;

print join " ",@sorted;
print ": alphabetical\n";

print join " ", @numSorted;
print ": numeriek\n";





__DATA__
Door bovenstaande lijn is er een scheiding tussen programma en invoerdata
Shake the cloud from off your brow,
Fate your whishes does allow;
Empire growing,
testlijn 3
testlijn 4
testlijn 5
testlijn 6

testlijn 7
testlijn 8


testlijn 9