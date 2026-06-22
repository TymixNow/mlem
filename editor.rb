require_relative 'commwrapper/comms'
require_relative 'utils/cross'
require_relative 'mlem'
class Editor
    def initialize(file, mode)
        comm = Comms.open("./#{file}.txt", mode)
        comm.comment("Project #{file} \n")
        print("new init? [y|n] > ")
        mode_in = gets[0].downcase == "y"
        file_in = comm.ask("init file > ")
        output = MLEM.new("./#{file_in}.txt", mode_in)
        while true
            case comm.ask("action [Suff, Pref, Apply, eXit] > ")[0].downcase
            when "s"
                file_in = comm.ask("suffix file > ")
                output.suff("./#{file_in}.txt", mode_in)
            when "p"
                file_in = comm.ask("prefix file > ")
                output.pref("./#{file_in}.txt", mode_in)
            when "a"
                file_in = comm.ask("mult file > ")
                output.apply("./#{file_in}.txt", mode_in)
            when "x"
                break
            end
        end
        comm.close
    end
end