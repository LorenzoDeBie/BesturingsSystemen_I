=begin opgave
Op welke verschillende manieren kun je een scalaire variabele invullen met een referentie naar een array ?
=cut

@array = qw(dit is een array van woorden);
# Manier 1: reference naar array maken
$manier1 = \@array;
# Manier 2: een nieuwe array aanmaken en refernce ernaar opslaan
$manier2 = [ "dit", "is", "een", "array", "van", "woorden" ];
# Manier 3: Kopie van array maken en reference ernaar opslaan
$manier3 = [@array];
# Manier 4: Impliciete declaratie
@{$manier4} = ("dit", "is", "een", "array", "van", "woorden");


# Hoe kun je via deze referentie:
# een specifiek element van de array aanspreken ?
print "@$manier1[0]\n";
# een slice van de array aanspreken ?
print join " ", @$manier1[0..3]; print "\n";
# het laatste indexnummer bekomen ?
print $#$manier1; print "\n";
# het aantal elementen in de array bekomen ?
print scalar @$manier1; print "\n";
# een array element achteraan toevoegen ?
push @$manier1, "nieuwElement";
print join " ", @$manier1; print "\n";
# de array element per element verwerken ?
foreach $elem (@$manier1) {
    print "$elem ";
}
print "\n";




