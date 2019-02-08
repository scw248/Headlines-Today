class HeadlinesToday::Headline
    @@all = []
    attr_accessor :name, :source_url

    def self.today
        self.scrape_headlines
    end

    def self.all
      @@all
    end

    def self.scrape_headlines
        doc = Nokogiri::HTML(open("https://www.reuters.com/"))
        doc.css("article.story div.story-content h3.story-title").children.map do |h|
          headline = self.new
          headline.name = h.text.strip
          headline.source_url = h.parent.parent.attr('href').gsub("/article", "https://www.reuters.com/article")
          @@all << headline
          headline
        end          
    end

      def story
        #binding.pry
          
          @story ||= Nokogiri::HTML(open(source_url)).css("div.StandardArticleBody_body").text.gsub("\u2019", "'").gsub("\u201C","").gsub("\u201D","").gsub(/^[FILE].+[Photo]$/, "").sub!(/Reporting.*/mi, "")
      end


end


#STUFF FOR NPR

  #     doc = Nokogiri::HTML(open("https://www.npr.org/?refresh=true"))
  
    #     doc.css("#contentWrap").each do |headline|
    #       headline = self.new
    #       headline.name = headline.css(".stories-wrap-featured h3.title").first.text
    #       headline.source_url = headline.css(".story-text a").attribute("href").value
    #       headlines << headline
    #     end
    #     headlines
    # end



    # doc.css(".story").each do |content|
          #   stories << content.css("p")
          # end