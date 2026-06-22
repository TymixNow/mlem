require_relative 'mlem'
require_relative 'utils/cross'

output = MLEM.new

output.suff("./words.txt", false)
output.suff("./suff.txt", false)

output.apply("./mult.txt", false)