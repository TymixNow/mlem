require_relative 'commwrapper/comms'
require_relative 'utils/cross'
class MLEM
    @file
    @mode
    @phon
    @lex
    attr_accessor :phon, :lex
    def initialize(file, mode)
        @file = file
        @mode = mode
    end
    def apply
        comm = Comms.open(@file, @mode)
        out = []
        forms = transpose([cross(@phon), cross(@lex)])
        forms.each do |form|
            f_phon = form[0].join('')
            f_lex = form[1].join(' ')
            q = "#{f_lex}: (#{f_phon}) > "
            ans = comm.ask(q)
            out << ans unless ans == ""
        end
        comm.close
    end
end