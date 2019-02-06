class HeadlinesToday::CLI

def call
  list_headlines
  options
  exit
end

def list_headlines
   @headlines = HeadlinesToday::Headline.today
   @headlines.each.with_index(1) do |headline, i|
    puts "#{i}. #{headline.name} - #{headline.source_url}"
    end
end

def options
    input = nil
  
    while input != "exit" 
        puts "Type headline number you’d like to read more about, type list to see headlines again, or type exit to leave program:"
        input = gets.strip.downcase

        if input.to_i > 0 && input.to_i < @headlines.count
            puts HeadlinesToday::Headline.scrape_story[input.to_i - 1]
        elsif input == "list"
            list_headlines
        else
            if input != "exit" 
            puts "Number given does not exist in list.  Type list or exit"
            end
        end
    end
end

def exit
    puts "Come back tomorrow for more headlines!"
end
    

end