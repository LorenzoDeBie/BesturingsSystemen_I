# array = @array
# hash = %hash

@A=qw(zeven zeven een nul twaalf elf drie twaalf tien elf twaalf zeven vijf negen tien zeven zeven);

@B=qw(drie zes negen elf elf acht twaalf twee tien);

# maakt paren uit array A, maar hier wordt zeven een paar keer opnieuw geïnitialiseerd
# %H=@A;

#maakt van ieder element van de array @A een koppel van @A[$_] zodat we in de for loop wel iedere unieke index uit array @A
# praktisch nut: alle unieke elementen uit de array krijgen
# %H = map {($_, undef)} @A;

# element verwijderen uit een lijst, geeft geen fout indien element niet bestaat
# delete $A{"ik weet niet wat"};

# verwijder elk element van B uit H
# delete $H{$_} for @B; # hier delete ik maar 1 waarde per loop van de for --> $ voor H
# of
# delete @H{@B}; # hier delete ik meerdere elementen in 1 keer --> @ voor H

# print join "\n",map {"$_: $H{$_}"} %H;
# print "\n\n";

#als ik gesorteerde volgorde wil moet dit bij verwerken
# for (sort keys %H) {
#     print "$_: $H{$_}\n";
# }


#Vraag 30
#alle elementen die in beide voorkomen
# %H = map {($_, $_)} @A;
# @intersectie = delete @H{@B};

# print join " ",@intersectie;

# #unie
# %H = map {($_, $_)} @A, @B;

# print "$_\n" for keys %H;

# #verschil
# %H = map {($_,$_)} @A;
# %G = map {($_,$_)} @B;

# delete @H{@B};
# delete @G{@A};

# %result = (%H, %G);

# print "$_\n" for keys %result;

# oplossing uit de les
$H{$_} |= 1 for @A;
$H{$_} |= 2 for @B;

print join "\n",map {"$_: $H{$_}"} sort {$H{$a} <=> $H{$b}} keys %H;


@C = qw(nul een twee drie vier vijf zes zeven acht negen tien elf twaalf);

%H = map {(@C[$_], $_)} 0..$#C;
%H = reverse %H;

