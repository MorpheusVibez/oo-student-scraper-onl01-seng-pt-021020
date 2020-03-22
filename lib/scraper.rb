require 'open-uri'
require 'pry'

class Scraper
  attr_accessor :student
  @@all = []

  def self.scrape_index_page(index_url)
    page = Nokogiri::HTML(open(index_url))

        students = []

        page.css("div.student-card").each do |student|

          students << {
             :name => student.css("h4.student-name").text,
             :location => student.css("p.student-location").text,
             :profile_url => student.children[1].attributes["href"].value
          }
        end
        students

    # doc = Nokogiri::HTML(open(index_url))
    #
    # students = []
    #
    # doc.css(".card-text-container").each do |card|
    #
    #   :name => card.css(".card-text-container").css("h4").text
    #   :location => card.css(".card-text-container").css("p").text
    #   # :profile_url => card.css(".student-card").css("a").first["href"]
    #
    # # binding.pry
    # end
    # students
  end

  def self.scrape_profile_page(profile_url)

  end


end
