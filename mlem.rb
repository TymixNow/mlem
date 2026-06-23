require_relative 'commwrapper/comms'
require_relative 'utils/cross'
class MLEM
    @phon
    @lex
    attr_accessor :phon, :lex
    def initialize(file)
        @phon = []
        @lex = []
        pref(file)
    end
    def suff(file)
        comm = Comms.open(file)
        out_p = []
        out_l = []
        comm.comment("Suffixes: ")
        while true
            phon = comm.ask("add suffix (phon) > ")
            break if phon == ""
            lex = comm.ask("meaning (#{phon}) > ")
            break if lex == ""
            out_p << phon
            out_l << lex
        end
        @phon << out_p
        @lex << out_l
        comm.close
    end
    def pref(file)
        comm = Comms.open(file)
        out_p = []
        out_l = []
        comm.comment("Prefixes: ")
        while true
            phon = comm.ask("add prefix (phon) > ")
            break if phon == ""
            lex = comm.ask("meaning (#{phon}) > ")
            break if lex == ""
            out_p << phon
            out_l << lex
        end
        @phon.unshift(out_p)
        @lex.unshift(out_l)
        comm.close
    end
    def apply(file)
        comm = Comms.open(file)
        out_p = []
        out_l = []
        comm.comment("Multiplication: ")
        forms = transpose([cross(@phon), cross(@lex)])
        forms.each do |form|
            f_phon = form[0].join('')
            f_lex = form[1].join(' ')
            q = "#{f_lex}: (#{f_phon}) > "
            ans = comm.ask(q)
            unless ans == ""
                out_p << f_phon
                out_l << ans
            end
        end
        @phon = [out_p]
        @lex = [out_l]
        comm.close
    end
end