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
  end

  def self.scrape_profile_page(profile_url)
    page = Nokogiri::HTML(open(profile_url))
  end


end
