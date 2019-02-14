class HeadlinesToday::Headline
  attr_accessor :name, :source_url

  @@all = []

  def self.new_headline(h)
    new(h.text.strip, h.parent.parent.attr('href').gsub('/article', 'https://www.reuters.com/article'))
  end

  def initialize(name = nil, source_url = nil)
    @name = name
    @source_url = source_url
    @@all << self
    self
  end

  def self.all
    @@all
  end

  def story
    @story ||= HeadlinesToday::Scraper.new.get_story(source_url)
                                      .text
                                      .tr("\u2019", "'")
                                      .delete("\u201C")
                                      .delete("\u201D")
                                      .gsub(/\bFILE\b(.*?)\bREUTERS\b/, '')
                                      .gsub(/\(.*?\)/, '')
                                      .gsub(/.+?(?=REUTERS)/, '')
    WordWrap.ww(@story, 150)
            .partition('   ')
  end
end
