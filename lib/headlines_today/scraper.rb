class HeadlinesToday::Scraper

    def self.scrape_headlines
      headlines = []
    
      doc = Nokogiri::HTML(open("https://www.npr.org/?refresh=true"))

      doc.css(".stories-wrap stories-wrap-featured").each do |headline|
        # headline = Headline.new
        headline.name = doc.css(".title").text.strip
        binding.pry
        headline.source_url = doc.css(".story-text a").attribute("href").value
        headlines << headline
      end
      headlines
    end
    
    def self.scrape_story
      stories = []
      self.scrape_headlines.each do |headline|
        doc = Nokogiri::HTML(open("headline.source_url"))

        doc.css(".story").each do |story|
          stories << story.css("p")
        end
      end
    end
end