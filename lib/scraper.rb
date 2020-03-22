require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))

    doc.css(".card-text-container").each do |card|
      student = Student.new
      student.name = doc.css(".card-text-container").css("h4").text
      student.location = doc.css(".card-text-container").css("p").text
      student.profile_url = doc.css(".student-card").css("a").first["href"]
    binding.pry
  end

  def self.scrape_profile_page(profile_url)

  end

end
