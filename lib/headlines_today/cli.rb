class HeadlinesToday::CLI

    def call
        list_headlines
        options
        exit
    end

    def list_headlines
        @headlines = HeadlinesToday::Scraper.new.make_headlines 
        @headlines.each.with_index(1) do |headline, i|
        puts
        puts "#{i}. #{headline.name}"
        puts "#{headline.source_url}".colorize(:light_blue).underline
        puts 
        end
    end

    def options
        input = nil
    
        while input != "exit" 
            puts
            puts "Please type one of the following:
                  1). the 'number' of the headline you'd like to read more about
                  2). 'list'to see your headlines again
                  3). 'exit' to leave the program".colorize(:light_green)
            input = gets.chomp.downcase

            if input.to_i > 0 && input.to_i <= @headlines.count
                puts
                puts HeadlinesToday::Headline.all[input.to_i - 1].story
            elsif input == "list"
                list_headlines
            elsif input.to_i > @headlines.count
                puts
                puts "NUMBER GIVEN IS NOT IN LIST!".colorize(:red)
            end
        end
    end

    def exit
        puts
        puts "Come back tomorrow for more headlines!".colorize(:light_green)
        puts
    end
    

end