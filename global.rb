require_relative 'editor'

puts "    ##      ##          ##         ########  ##      ##     "
puts "   ####    ####        ##         ##        ####    ####    "
puts "  ##  ##  ##  ##      ##         ########  ##  ##  ##  ##   "
puts " ##    ####    ##    ##         ##        ##    ####    ##  "
puts "##      ##      ##  ########## ########  ##      ##      ## "
puts "\n"
print "new project? [y|n] > "
mode = gets[0].downcase == "y"
print "input project name > "
proj = gets.chomp
puts ""
ed = Editor.new(proj, mode)