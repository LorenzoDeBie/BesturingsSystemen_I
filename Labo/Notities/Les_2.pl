# $x=<DATA>;
# print $x;

# $x=<DATA>;
# $x=<DATA>;
# print $x;

# while(<DATA>) {
#     print $_;
# }

# $/=""; #forces paragraph mode to read data, reads untill empty line, wordt niet veel gebruikt
# undef $/; #forces "slurp" mode, reads whole data at once --> whole text as a string! --> wordt meer gebruikt
# $x=<DATA>;
# print $x;

# @T=<DATA>; #assigns all data line per line to table T

# for(@T) {
#     print $_;
# }

# print @T; #print the whole tabel line per line
# print 0+@T; #forces @T to scalar context ("bad" way)
# print scalar @T; #("good" way)

# @argv zelf opvullen in programma
@ARGV=("test.txt");

# # wat als ik invoer wil via parameters (zoals argv en argc in C)?
undef $/;
@T=<>;
print scalar @T;

# <> operator wijzigt @argv --> kan het maar 1 keer lezen, daarna argv is leeg
#DIT KOMT OP EXAMEN --> eerst bestand lezen, verwerken en daarna opnieuw doorlopen maar in schrijf modus
# @bewaar=@ARGV;
# while(<>) {
#     print $_;
# }
# @ARGV=@bewaar;
# while(<>) {
#     print $_;
# }

# variable $^I ingesteld is op iets dat niet leeg is --> nieuwe file met inhoud van $^I --> zorgt voor backup!
# alle uitvoer die ik uitschrijf wordt naar origineel bestand geschreven!
# $^I = ".bak";
# while(<>) {
#     if(length($_) > 1) {
#         print "dit is een lijn\n";
#     }
#     else {
#         print "dit is ook een lijn\n";
#     }
# }


#grep is een for loop die een list returned waarvoor de voorwaarde voldaan is!
#@T = <DATA>;

# for( grep {length($_)>30} @T) {
#     print $_;
# }

# @x = grep {length($_) > 30} @T;

# print @x;

#grep is niet zo efficiënt --> beter
# while(<DATA>) {
#     if(length($_) > 30) {
#         print $_;
#         last;
#     }
# }

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