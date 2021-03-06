# cli - controller

class JobListings::Cli

def call
  get_search_word # house the og search word, pass to api, CREATE @instances
  menu # DISPLAY @instances, call exit_search_or_details control flow method
end

def get_search_word
  puts "********************************************************"
  puts "             Discover Tech Jobs in NY "
  puts "               Enter a Search Word: "
  puts "********************************************************"
  /n/
  user_input = gets.chomp.downcase
  Listing.api_response(user_input) # call api,  pass to `new_from_api` & create Listing instances
end

def menu # DISPLAY @instances,
  /n/
  /n/
  Listing.preview_all # display preview format of all instances
  /n/
  puts
  /n/
  exit_search_or_details
      # necessary to put this call here. keeps flow so user can go back and
      # choose a dif Number to see Job Details, WITHOUT re-calling the API
end

def exit_search_or_details
  /n/
  puts
  puts "______________________________________"
  puts "   What would you like to do next?"
  puts "______________________________________"
  /n/
  puts "--> To see details of a specific position, type the associated number. "
  puts "--> To search a new word, type:  search"
  puts "--> To leave my lovely program, type:  exit"
  /n/
  input2 = gets.chomp
  /n/
  puts
  /n/

  if input2 == "exit" # exit program
    puts "Thanks for stopping by!"
    return
  elsif input2 == "search"
    Listing.delete
    call
  elsif input2.to_i.between?(1, Listing.all.size) # validate Num, pass to job_details to retrieve deets
    job_details(input2)
  else # recursive call. goal: get a valid input2
    puts "*************************************"
    puts "     Hmm, somethings not right."
    puts "         Lets try again."
    puts "*************************************"
    /n/
    /n/
    exit_search_or_details
  end
end


def job_details(user_num)
  num =  user_num # save user input incase Error and else needs to recurse job_details(num)
  Listing.find_by_num(num) # FIND & DISPLAY object at the passed in index #

  /n/
  puts
  puts
  puts "______________________________________"
  puts "   What would you like to do next?"
  puts "______________________________________"
  /n/
  puts "--> To go back and enter a different number, type:  menu"
  puts "--> To search a new word, type:  search"
  puts "--> To leave my lovely program, type:  exit"
  /n/
  input3 = gets.chomp.downcase
  /n/
  /n/

  if input3 == "exit" # exit program
    puts "Thanks for stopping by!"
    return
  elsif input3 == "search" # erase Listing @instances. Ask for new search word.
    Listing.delete
    call
  elsif input3 == "menu" # display Num's  menu again.
    menu
  else # recursive call. goal: get a valid input3
    puts "*************************************"
    puts "     Hmm, somethings not right."
    puts "         Lets try again."
    puts "*************************************"
    /n/
    /n/
    job_details(num)
    /n/
  end
end
end
