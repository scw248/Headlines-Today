class HeadlinesToday::Headline

    attr_accessor :name, :source_url

    def self.today
        self.scrape_headlines
    end

    def self.scrape_headlines
        headlines = []
        doc = Nokogiri::HTML(open("https://www.npr.org/?refresh=true"))
  
        doc.css("#contentWrap").each do |headline|
          headline = self.new
          headline.name = doc.css(".stories-wrap-featured h3.title").first.text

          headline.source_url = doc.css(".story-text a").attribute("href").value
          headlines << headline
        end
        headlines
    end

      def self.scrape_story
        stories = []
        self.scrape_headlines.each do |headline|
          doc = Nokogiri::HTML(open("#{headline.source_url}"))
  
          doc.css(".story").each do |story|
            stories << story.css("p")
          end
        end
        stories
      end

end