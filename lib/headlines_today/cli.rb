class HeadlinesToday::CLI

def call
    list_headlines
    options
    exit
end

def list_headlines
    puts <<-DOC
    1. Headline_1, author, source_url
    2. Headline_2, author, source_url
    3. Headline_3, author, source_url
    DOC

    
end

def options
    input = nil
  
    while input != "exit" 
        puts "Type headline number you’d like to read more about, type list to see headlines again, or type exit to leave program:"
        input = gets.chomp.downcase

        case input  
        when "1"
            puts "More info on story 1"
        when "2"
            puts "More info on story 2"
        when "3"
            puts "More info on story 3"
        when "list"
            list_headlines
        else
            "Number given does not exist in list.  Type `list` or `exit`"
        end
    end
end

def exit
    puts "Come back tomorrow for more headlines!"
end
    

end