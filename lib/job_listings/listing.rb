require "rest-client"
require "json"

class Listing
  attr_accessor :company, :title, :date_posted, :url

  @@all = []

  def initialize(company, title, date_posted, url)
    @company = company
    @title = title
    @date_posted = date_posted
    @url = url
  end


  # 1) asks api for jobs matching the users input.
  # returns a Json object of that data.
  # pass ^ to self.new_from_api so i can make Listing instances for the Ruby search word
  def self.api_response(user_input)
    request = RestClient.get("https://jobs.github.com/positions.json?description=#{user_input}&location=new+york")
    response = JSON.parse(request)
    new_from_api(response)
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  # 2)
  def self.new_from_api(listings)
    listings.each do |listing|
      company = listing["company"]
      title = listing["title"]
      date_posted = listing["created_at"]
      url = listing["url"]

      list = Listing.new(company, title, date_posted, url)
      list.save
    end
    # iterate through listings using each
        # create variables and set them equal to the value of each key we want to use


        # create new Listing objects and pass in ^^
        # call a save instance method. this gives me freedom to to the Listing instance, before it gets added to @@all
  end
end
