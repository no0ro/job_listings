require "rest-client"
require "json"

class Listing


  def self.api_response(user_input)
    request = RestClient.get("https://jobs.github.com/positions?description=#{user_input}&location=new+york")
    response = JSON.parse(request)
    # method that takes ^ and creates Listing objects
  end

  def self.new_from_api(listings)
    # iterate through listings using each
        # create variables and set them equal to the value of each key we want to use


        # create new Listing objects and pass in ^^
        # call a save instance method. this gives me freedom to to the Listing instance, before it gets added to @@all 
  end
end
