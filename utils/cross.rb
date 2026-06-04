def cross(table)
    out = [[]]
    table.each do |set|
        temp = []
        out.each do |chain|
            set.each do |elem|
                temp << chain + [elem]
            end
        end
        out = temp
    end
    return out
end

def transpose(table)
    out = []
    table.each do |row|
        row.each_with_index do |elem,ix|
            while out.size <= ix 
                out << []
            end
            out[ix] << elem
        end
    end
    return out
end