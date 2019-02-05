class HeadlinesToday::Headline

    attr_accessor :name, :author, :source_url

    def self.today

        HeadlinesToday::Scraper.new(https://www.npr.org/)

        headline_1 = self.new
        headline_1.name = "headline name"
        headline_1.author = "author name"
        headline_1.source_url = "https://www.npr.com"

        headline_2 = self.new
        headline_2.name = "headline name2"
        headline_2.author = "author name2"
        headline_2.source_url = "https://www.npr.com"

        [headline_1, headline_2]

    end

end