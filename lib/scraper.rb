require 'open-uri'
require 'pry'

class Scraper
  attr_accesor :student
  @@all = []

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))

    students = []

    doc.css(".card-text-container").each do |card|
      students << {
      :name => card.css(".card-text-container").css("h4").text
      :location => card.css(".card-text-container").css("p").text
      :profile_url => card.css(".student-card").css("a").first["href"]
    }end
    # binding.pry
    end
    students
  end

  def self.scrape_profile_page(profile_url)

  end

end
