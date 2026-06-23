class Comms
    @wmode
    @file
    @cache

    def initialize(file, mode = false)
        mode ||= !File.file?(file)
        @wmode = mode
        @cache = ""
        if @wmode then
            @file = File.open(file, "a")
        else
            @file = File.open(file, "r")
        end
    end

    def ended?
        return false if @wmode
        return @file.eof?
    end

    class << self
        alias_method :open, :new
    end

    def comment(c)
        print c
    end

    def ask(q, saves = true)
        if @wmode then
            print q
            ans = gets.chomp
            @cache += "#{ans}\n"
            save() if saves
            return ans
        else
            print q
            ans = @file.gets.chomp
            puts ans
            return ans
        end
    end

    def save
        @file.puts(@cache)
        drop()
    end

    def drop
        @cache = ""
    end

    def close
        @file.close
    end
end
