class HeadlinesToday::Headline

    attr_accessor :name, :source_url

    def self.today
        self.scrape_headlines
    end

    def self.scrape_headlines
        headlines = []

        doc = Nokogiri::HTML(open("https://www.reuters.com/"))

        doc.css(".group").each do |section|
          section.css("article.story div.story-content").each do |headline|
            headline = self.new
            headline.name = doc.css("a h3.story-title").text
            headline.source_url = doc.css("article.story div.story-content a").attribute("href").value.gsub("/article", "https://www.reuters.com/article")
            headlines << headline
          end
        end
        headlines
    end

    #     doc = Nokogiri::HTML(open("https://www.npr.org/?refresh=true"))
  
    #     doc.css("#contentWrap").each do |headline|
    #       headline = self.new
    #       headline.name = headline.css(".stories-wrap-featured h3.title").first.text
    #       headline.source_url = headline.css(".story-text a").attribute("href").value
    #       headlines << headline
    #     end
    #     headlines
    # end

      def self.scrape_story
        stories = []
        #binding.pry
        self.scrape_headlines.each do |headline|
          doc = Nokogiri::HTML(open("#{headline.source_url}"))
          
          doc.css(".story").each do |story|
            stories << story.css("p")
          end
        end
        stories
      end

end