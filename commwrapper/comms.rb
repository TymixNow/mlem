class Comms
    @wmode
    @file

    def initialize(f, mode)
        @wmode = mode
        if @wmode then
            @file = File.open(f, "a")
        else
            @file = File.open(f, "r")
        end
    end

    class << self
        alias_method :open, :new
    end

    def ask(q)
        if @wmode then
            print q
            ans = gets.chomp
            @file.puts ans
            return ans
        else
            print q
            ans = @file.gets.chomp
            puts ans
            return ans
        end
    end

    def close
        @file.close
    end
end
