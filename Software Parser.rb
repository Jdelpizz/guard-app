File.open("list.txt").each do |line|
        puts /^[A-Z][a-z]+\s[A-Z][a-z]+/.match(line) # name
        puts /\b[MWFTR]+\b\s\d{4}\-\d{4}/.match(line) #times
      end 
