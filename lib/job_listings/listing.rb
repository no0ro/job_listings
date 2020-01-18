require "rest-client"
require "json"

class Listing
  attr_accessor :company, :title, :date_posted, :url

  @@all = []

  def initialize(company, title)
    @company = company
    @title = title
  end

  # 1) asks api for jobs matching the users input. returns a Json object of that data.
  # pass ^ to self.new_from_api to instanciate Listing @instances(objects)
  # < called by `get_search_word`
  def self.api_response(user_input)
    request = RestClient.get("https://jobs.github.com/positions.json?description=#{user_input}&location=new+york")
    response = JSON.parse(request)
    self.new_from_api(response)
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.delete
    @@all = []
  end

  # < called by `menu`
  # iterate through every item in @@all, return each item with its index and title property displayed
  def self.preview_all
    Listing.all.map.with_index do |list, index|
      puts ""
      puts "#{index+1}. #{list.title}"
    end
  end

  # < called by `job_detailss`
  def self.find_by_num(user_selection)
    list = self.all[user_selection.to_i-1] # returns the @instance matching the index
    list.detailed_display # display contents of ^ @instance
  end

  # called by  ^
  # instance method, show the details of the called on object
  def detailed_display
    puts "  Company:      #{self.company}"
    puts "  Position:     #{self.title}"
    puts "  Date Posted:  #{self.date_posted}"
    puts "  Website:      #{self.url}"
  end

  # 2) iterate through #{user_input} listings
  # create variables and set them equal to the result of each key's value
  # create new Listing instance and pass in ^^ to be initialized with, or add them "manually" below
  # call instance method `save` to push the the completed @instance into the class variable @@all
  # called by ^ `api_response`
  def self.new_from_api(listings)
    listings.each do |listing|
      company = listing["company"]
      title = listing["title"]
      date_posted = listing["created_at"].slice(0,11)
      url = listing["company_url"]

      list = Listing.new(company, title)
      list.date_posted = date_posted
      if url == nil ? (list.url = "Google them! The website is MIA on our end.") : (list.url = url)
      end

      list.save # this list.save location lets me add non-initialized instance variables to each Listing instance, before it gets saved to @@all
    end
  end

end
