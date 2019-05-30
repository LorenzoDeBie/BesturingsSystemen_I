=begin opgave
Je kan ook een scalaire variabele invullen met een referentie naar een scalaire variabele of een scalaire constante.
Op welke verschillende manieren ?
Hoe kun je via deze referentie de oorspronkelijke waarde aanspreken of wijzigen ?
=cut

$variabele = 213;
$variabeleRef = \$variabele;
$constanteRef = \214;
print "Voor veranderen:\n$variabele\t$$constanteRef\n";
$$variabeleRef = 222;
#$$constanteRef = 223; kan niet!
print "Na veranderen:\n$variabele\t$$constanteRef\n";