require_relative 'commwrapper/comms'
require_relative 'utils/cross'
require_relative 'mlem'
class Editor
    def initialize(file)
        comm = Comms.open("./#{file}.txt")
        comm.comment("Project #{file} \n")
        file_in = comm.ask("init file > ")
        output = MLEM.new("./#{file_in}.txt")
        while true
            case comm.ask("action [Suff, Pref, Apply, eXit] > ", false)[0].downcase
            when "s"
                file_in = comm.ask("suffix file > ")
                output.suff("./#{file_in}.txt")
            when "p"
                file_in = comm.ask("prefix file > ")
                output.pref("./#{file_in}.txt")
            when "a"
                file_in = comm.ask("mult file > ")
                output.apply("./#{file_in}.txt")
            when "x"
                comm.drop()
                break
            end
            if comm.ended?
                comm = Comms.open("./#{file}.txt", true)
            end
        end
        comm.close
    end
end