# cli - controller

class JobListings::Cli

def call
  get_search_word # hold the og search word
  #call_api_create_instances(user_input) # will call api again.  will create instances
  menu
end

def get_search_word
  puts "********************************************************"
  puts "             Discover Tech Jobs in NY "
  puts "               Enter a Search Word: "
  puts "********************************************************"
  puts ""
  user_input = gets.chomp.downcase
  Listing.api_response(user_input)
end

# def call_api_create_instances(user_input) #call api > pass to `new_from_api` & create Listing instances
#
# end

def menu
  puts ""
  puts ""
  Listing.preview_all #display preview format of all instances
  #Listing.detailed_all #display detailed  format of all instances
  puts ""
  exit_search_or_details #necessary to put call  here so that refer to it as menu
end


def exit_search_or_details
  puts ""
  puts "______________________________________"
  puts "   What would you like to do next?"
  puts "______________________________________"
  puts ""
  puts "--> To see details of a specific position, type the associated number. " #{}"Type The Number Of A Position To Learn More About It."

  # puts "To see details about all of the above positions, type: all "
      #type the number of a position to learn more about it
  puts "--> To search a new word, type:  search"
  puts "--> To leave my lovely program, type:  exit"
  puts ""
  input2 = gets.chomp
  puts ""
  puts ""
    # [TO DO] validate
      # does this word return any search rresults?!?!?
        # if word: downcase, validate for downcase, TWO WORDS
        # if number: between 1-List.length?
        # else: not valid input, lets try this again display_selected()

# elsif input2 == "all" # puts Listing.detailed_all
  if input2 == "exit"
    return
  elsif input2 == "search"
    Listing.delete
    call()
  elsif input2.to_i.between?(1, Listing.all.size) # a number (bc already validating up above)s
    job_details(input2)
    #number between 0 and Listing.length (validation)
    #full dissplay of this listing,
          # hmm decide later when and if to make a method here.
          # options to go back to start and enter keyword
          # exit
          # go back and sxelect a different num - menu(input) (hmmm this wont persist, so Listing.preview_all)
  else
    puts "___________________________________"
    puts "Hmm, somethings not right."
    puts "Lets try again."
    exit_search_or_details()
  end
end

def job_details(user_num)
  Listing.find_by_num(user_num) # finds object

  puts ""
  puts "______________________________________"
  puts "   What would you like to do next?" #type the  letter in [] of what you'd like to do next
  puts "______________________________________"
  puts ""
  puts "--> To go back and enter a different number, type:  menu" #type the number of a position to learn more about it
  puts "--> To search a new word, type:  search"
  puts "--> To leave my lovely program, type:  exit"
  puts ""
  input3 = gets.chomp.downcase
  puts ""
  puts ""
  # [TO DO] validate
      # if word: downcase, validate for downcase, TWO WORDS
      # if number: between 1-List.length?
      # else: not valid input, lets try this again display_selected()
  if input3 == "exit"
    return
  elsif input3 == "search"
    Listing.delete
    call()
  elsif input3 == "menu"
    menu()
  end
end

end
