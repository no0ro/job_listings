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


  def self.find_by_num(user_selection)
    list = self.all[user_selection.to_i-1] # returns the @instance matching the index
    list.detailed_display # display contents of ^ @instance
  end

# selected a specific instance, now show the detail
  def detailed_display
    puts "  Company:      #{self.company}"
    puts "  Position:     #{self.title}"
    puts "  Date Posted:  #{self.date_posted}"
    puts "  Website:      #{self.url}"
  end

  # 2) iterate through #{user_input} listings
  # create variables and set them equal to the value of each key we want to use
  # create new Listing objects and pass in ^^ to be initialized as instance variables
  # call a save instance method.
  def self.new_from_api(listings)
    listings.each do |listing|
      company = listing["company"]
      title = listing["title"]
      date_posted = listing["created_at"].slice(0,11)
      url = listing["company_url"]

      list = Listing.new(company, title)

      # placing save here gives me freedom to add to the Listing instance, before it gets added to @@all, down the road if i choose
      list.date_posted = date_posted
      if url == nil ? (list.url = "Google them! The website is MIA on our end.") : (list.url = url)
      end # <-- why?
      list.save
    end
  end

end
