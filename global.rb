require_relative 'editor'

puts "    ##      ##          ##         ########  ##      ##     "
puts "   ####    ####        ##         ##        ####    ####    "
puts "  ##  ##  ##  ##      ##         ########  ##  ##  ##  ##   "
puts " ##    ####    ##    ##         ##        ##    ####    ##  "
puts "##      ##      ##  ########## ########  ##      ##      ## "
puts "\n"
print "input project name > "
proj = gets.chomp
puts ""
ed = Editor.new(proj)