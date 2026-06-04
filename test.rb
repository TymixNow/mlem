require_relative 'mlem'
require_relative 'utils/cross'

#input = MLEM.new("./test.txt", true)
pref = <<END_LIST.split("\n").map{ |x| x.split(" ")}.map{ |x| [x[0], x[1..-1].join(" ")]}
do3in human
hi'in one
ze'in see
ti3o you
nimzu up
mupu few
tamen no
himje all
jaki good
mwebu bad
bimte time
nu3o near
tinpe touch
ginni small
3inu make
hur hear
3om me
njam say
twer place
3an death
dum down
gjon many
jan some
twam big
kje want
gam think
dja do
pwan have
djol life
mjan more
her feel
vjon difference
END_LIST

suff = <<END_SUFF.split("\n").map{ |x| x.split(" ")}.map{ |x| [x[0], x[1..-1].join(" ")]}
3in [personal]
'in [object]
3inja [personal collective]
'inja [object collective]
da [verb]
da3i [verb causative]
twe [adverb of location]
bim [adverb of time]
3i [adverb of effect]
pwa [adjective]
END_SUFF

data = transpose([transpose(pref), transpose(suff)])
phon = data[0]
lex = data[1]

#input.phon = phon
#input.lex = lex

#input.apply
output = MLEM.new("./test.txt", false)

output.phon = phon
output.lex = lex

output.apply