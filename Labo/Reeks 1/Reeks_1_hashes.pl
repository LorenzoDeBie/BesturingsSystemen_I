@A=qw(zeven zeven een nul twaalf elf drie twaalf tien elf twaalf zeven vijf negen tien zeven zeven);

@B=qw(drie zes negen elf elf acht twaalf twee tien);

%hash = map{($_, undef)} @A;


#Oefening 27
# Door gebruik te maken van hashes!!


#Oefening 28
# %hash = map{($_, undef)} @A;

# @unieke = keys %hash;

# print join " ", @unieke;


#Oefening 29
#bepaal alle waarden van een lijst die niet in een andere lijst voorkomen
# %hash = map {($_,undef)} @A;
# delete @hash{@B};
# print keys %hash;
#pas dit nu toe om alle lijnen uit een bestand te filteren die niet voorkomen in een ander bestand
# @file1;
# @file2;
# $/ = "\r\n"; #deze lijn is zeeeer belangrijk zo te zien
# while(<>) {
#     chomp;
#     push @file1, $_;
#     if(eof) {
#         last;
#     }
# }

# while(<>) {
#     chomp;
#     push @file2, $_;
#     if(eof) {
#         last;
#     }
# }

# %hash1 = map{($_, undef)} @file1;
# delete @hash1{@file2};
# print keys %hash1;


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

# # oplossing uit de les
# $H{$_} |= 1 for @A;
# $H{$_} |= 2 for @B;

# print join "\n",map {"$_: $H{$_}"} sort {$H{$a} <=> $H{$b}} keys %H;


#vraag 31
#met welke twee functies kun je nagaan of een specifieke waarde optreed als index in een hash
# @indexes_to_test = qw(nul een twee drie vier vijf zes zeven acht negen tien elf twaalf);

# for(@indexes_to_test) {
#     if(exists $hash{$_}) {
#         print "%hash{$_}\n";
#     }
# }


#vraag 32
#Verwijder een hash element met een specifieke index. Hoe kan dit veralgemeend worden naar meerdere elementen?
# @indexes_to_delete = qw(nul twee vier zes acht tien);

# delete $hash{"drie"};

# print sort(keys %hash);

# delete @hash{@indexes_to_delete};

# print "na deleten van meerdere\n";
# print sort(keys %hash);

#vraag 33
# Op welke manieren kun je elk index-waarde paar van een hash element per element verwerken?
# Hou er rekening mee dat verwerken in gesorteerde volgorde al dan niet gewenst is.
# foreach $key (keys %hash) {
#     $value = $hash{$key};
#     #do something with the key/value pair
#     print "$key: $value\n";
# }


#vraag 34
# Hoe kun je de inhoud van een hash tonen, waarbij een duidelijk onderscheid gemaakt wordt tussen de indeices en hun corresponderende waarden.
# Eenvoudige pogingen zoals print"%hash" of print %hash blijven niet te voldoen
# while(($k,$v) = each %hash) {
#     print "$k => $v\n";
# }


@C = qw(nul een twee drie vier vijf zes zeven acht negen tien elf twaalf);

%H = map {(@C[$_], $_)} 0..$#C;
#vraag 35
# Inverteer een hash: construeer een hash met als indices de waarden en omgekeerd

# #%H = reverse %H;

# for $key (sort {$a <=> $b} keys %H) {
#     $value = $H{$key};
#     print "$key => $value\n";
# }


#vraag 36
# Verwerk de elementen van een hash in een gesorteerde volgorde
# - hetzij alfabetisch of numeriek gesorteerd op de indices
# - hetzij alfabetisch of numeriek gesorteerd op de waarden

#aflabetisch op indices
# for $key (sort keys %H) {
#     $value = $H{$key};
#     print "$key => $value\n";
# }

# #numeriek op indices
# for $key (sort {$a <=> $b} keys %H) {
#     $value = $H{$key};
#     print "$key => $value\n";
# }

# #alfabetisch op values
# for $value (sort values %H) {
#     #do something with the value (idk how to get key)
# }

# #numeriek op values
# for $value (sort{$a <=> $b} (values %H)) {
#     #do something with the value (idk how to get key)
#     print $value;
# }



%H1 = (0, "nul", 2, "twee", 3, "drie_een", 4, "vier", 6, "zes", 8, "acht");
%H2 = (1, "een", 3, "drie", 4, "vier_twee", 5, "vijf", 7, "zeven", 9, "negen");

#vraag 37
# Stel een nieuwe hash samen op basis van twee bestaande hashes.
# je hoeft geen rekening te houden met indices die in beide originele hashes zouden voorkomen

# %merges = (%H1, %H2);

# for $key (sort keys %merges) {
#     $value = $merges{$key};
#     print "$key => $value\n";
# }


#vraag 38
# Veronderstel dat je over twee hashes beschikt.
# Bepaal enerzijds de indices die in beide hashes, en anderzijds de indices die slechts in één van beide hashes voorkomen
# @beide;
# @enkel_in_1;

# %merged = (%H1, %H2);

# for $key (keys %H1) {
#     push(@beide, $key) if exists $H2{$key};
# }

# delete @merged{@beide};

# print "keys in beide:\n";
# print @beide;
# print "\nkeys in 1 van de twee:\n";
# print sort keys %merged;


# vraag 39
# Hoe kun je best bepalen hoeveel keer elke waarde in een tabel optreedt?
%freq_tabel;
for $item (@A) {
    $freq_tabel{$item}++;
}

for $key (sort keys %freq_tabel) {
    $value = %freq_tabel{$key};
    print "$key => $value\n";
}