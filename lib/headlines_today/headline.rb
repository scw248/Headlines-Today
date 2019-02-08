class HeadlinesToday::Headline
    @@all = []
    attr_accessor :name, :source_url

    def self.new_headline(h)
      self.new(h.text.strip, h.parent.parent.attr('href').gsub("/article", "https://www.reuters.com/article"))
    end

    def initialize(name = nil, source_url = nil)
      @name = name
      @source_url = source_url
      @@all << self
      @@all
    end

    def self.all
      @@all
    end

      def story
         @story ||= HeadlinesToday::Scraper.new.get_story(source_url)
          .text
          .gsub("\u2019", "'")
          .gsub("\u201C","")
          .gsub("\u201D","")
          .gsub(/\bFILE\b(.*?)\bREUTERS..........\b/, "")
          .gsub(/\(.*?\)/, "")
        WordWrap.ww(@story, 150)
      end


end


