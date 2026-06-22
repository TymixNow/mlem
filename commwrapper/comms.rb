class Comms
    @wmode
    @file
    @filename

    def initialize(f, mode)
        @filename = f
        @wmode = mode
        if @wmode then
            @file = File.open(f, "a")
        else
            @file = File.open(f, "r")
        end
    end

    def add
        @file.close
        @file = File.open(f, "a")
        @wmode = true
    end

    class << self
        alias_method :open, :new
    end

    def comment(c)
        print c
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
