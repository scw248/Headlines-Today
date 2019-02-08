class HeadlinesToday::CLI

def call
  list_headlines
  options
  exit
end

def list_headlines
   @headlines = HeadlinesToday::Headline.today
   @headlines.each.with_index(1) do |headline, i|
    puts "#{i}. #{headline.name}"
    puts "#{headline.source_url}"
    puts 
    end
end

def options
    input = nil
  
    while input != "exit" 
        puts 
        puts "Type headline number you’d like to read more about, type list to see headlines again, or type exit to leave program:"
        input = gets.strip.downcase

        if input.to_i > 0 && input.to_i < @headlines.count
            puts
            puts HeadlinesToday::Headline.all[input.to_i - 1].story
        elsif input == "list"
            list_headlines
        elsif input.to_i > @headlines.count
            puts
            puts "Number given does not exist in list.  Type list or exit"
        end
    end
end

def exit
    puts
    puts "Come back tomorrow for more headlines!"
end
    

end