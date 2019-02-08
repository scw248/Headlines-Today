class HeadlinesToday::Scraper

  def get_page
    doc = Nokogiri::HTML(open("https://www.reuters.com/"))
  end

  def scrape_top_stories
    self.get_page.css("article.story div.story-content h3.story-title").children
  end

  def make_headlines
    scrape_top_stories.map do |h|
      HeadlinesToday::Headline.new_headline(h)
    end
  end

  def get_story(source_url)
    Nokogiri::HTML(open(source_url)).css("div.StandardArticleBody_body")
  end
end