# while(<>) {

#     m<
#         \#
#         \ [aeiou]     #commentaar
#     >ximsgce #dit zijn modifiers

#     if(m<([aeiou])\1>i) {
#         print $_;
#     }


#     #of korter met /

#     if(/([aeiou])\1/i) {
#         print $_;
#     }
# }



undef $/;               #in slurp mode
$_=<DATA>;           
# if(/^(L.*?\.)/sm) {     #op zoek naar eerste lijn die met een L begint
#     print "$1\n";
# }

# while(/^(L.*?\.)/smg) {  #op zoek naar alle lijnen die met een L begint --> progressief zoeken
#     $x++;
#     print "($x): $1\n";
# }    

@T=($_=~m/^L.*?\./gcsm); #alle resultaten in een array steken
print scalar @T;

#Modifiers:
# i = case INsensitive
# x = free spacing mode --> alle whitespace wordt weggedaan
# g = progressief zoeken (zie voorbeeld met while lus)
# c = laat pointer staan na negatiefe search



__DATA__
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
Sollicitudin tempor id eu nisl.
Vulputate sapien nec sagittis aliquam malesuada bibendum arcu.
Nisl pretium fusce id velit ut tortor pretium viverra suspendisse.
Mattis aliquam faucibus purus in massa tempor nec feugiat nisl.
Enim diam vulputate ut pharetra sit amet aliquam id.
Lacus sed viverra tellus in.
Ultricies mi quis hendrerit dolor magna.
Est ante in nibh mauris cursus mattis molestie a iaculis.
Mauris pharetra et ultrices neque ornare aenean.
Lorem ipsum dolor sit amet consectetur.
Nisi est sit amet facilisis magna etiam.

Amet mauris commodo quis imperdiet massa tincidunt.
Adipiscing elit pellentesque habitant morbi.
Purus non enim praesent elementum facilisis leo vel fringilla est.
Luctus venenatis lectus magna fringilla.
Vel pharetra vel turpis nunc eget.
Rhoncus mattis rhoncus urna neque viverra.
Vitae purus faucibus ornare suspendisse sed nisi lacus sed.
Et ultrices neque ornare aenean euismod elementum nisi quis eleifend.
Varius vel pharetra vel turpis nunc eget lorem dolor sed.
Diam donec adipiscing tristique risus nec feugiat in fermentum posuere.
Congue nisi vitae suscipit tellus.
Feugiat in ante metus dictum at tempor commodo ullamcorper a.
Pretium lectus quam id leo.
Est lorem ipsum dolor sit amet consectetur adipiscing.
Mattis nunc sed blandit libero volutpat sed cras.
Vivamus arcu felis bibendum ut tristique.

Id volutpat lacus laoreet non curabitur gravida arcu ac.
Ornare massa eget egestas purus viverra accumsan in nisl.
Quam quisque id diam vel.\nUllamcorper sit amet risus nullam eget felis eget\.
Odio ut sem nulla pharetra diam sit amet.
Vitae tempus quam pellentesque nec nam aliquam sem et.
Nulla pellentesque dignissim enim sit amet.
Quis auctor elit sed vulputate mi.
Morbi leo urna molestie at elementum eu facilisis.
Tristique senectus et netus et malesuada fames ac turpis.
Amet volutpat consequat mauris nunc congue.
Egestas integer eget aliquet nibh.
Nisl nisi scelerisque eu ultrices vitae auctor eu augue ut.
Lacus vel facilisis volutpat est velit egestas.
Volutpat est velit egestas dui.
Amet mattis vulputate enim nulla aliquet.
Non enim praesent elementum facilisis leo vel fringilla est.
Faucibus turpis in eu mi bibendum neque egestas congue.
Risus nullam eget felis eget.
Dui ut ornare lectus sit amet est.

Quisque egestas diam in arcu cursus euismod quis.
Convallis posuere morbi leo urna molestie at elementum eu facilisis.
Penatibus et magnis dis parturient montes nascetur.
Libero volutpat sed cras ornare.
Tristique magna sit amet purus gravida quis blandit turpis cursus.
Eu facilisis sed odio morbi.
Lectus proin nibh nisl condimentum id venenatis a condimentum.
Amet dictum sit amet justo donec enim diam vulputate.
Ut tortor pretium viverra suspendisse potenti nullam ac tortor vitae.
Interdum varius sit amet mattis vulputate.
Nisl suscipit adipiscing bibendum est.
Dui nunc mattis enim ut tellus elementum sagittis.
Integer enim neque volutpat ac tincidunt vitae.
Aliquet nec ullamcorper sit amet risus nullam eget felis eget.

Arcu felis bibendum ut tristique et egestas quis ipsum.
Non diam phasellus vestibulum lorem sed risus ultricies.
Vestibulum morbi blandit cursus risus at ultrices.
Ultrices eros in cursus turpis massa tincidunt dui ut ornare.
Dignissim enim sit amet venenatis urna cursus eget nunc scelerisque.
Pretium quam vulputate dignissim suspendisse in est.
Sollicitudin ac orci phasellus egestas tellus rutrum tellus pellentesque.
Faucibus vitae aliquet nec ullamcorper sit.
Eu facilisis sed odio morbi.
At tellus at urna condimentum mattis pellentesque id nibh.
Elementum nisi quis eleifend quam adipiscing vitae proin sagittis.
Mi quis hendrerit dolor magna eget est lorem ipsum.
Enim tortor at auctor urna nunc id cursus metus.
Leo vel fringilla est ullamcorper eget.