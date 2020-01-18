# cli - controller

class JobListings::CLI

def call
  user_input = get_search_word # hold the og search word
  call_api_create_instances(user_input) # will call api again.  will create instances
  display_preview
end

def get_search_word
  puts "Discover open tech jobs in NY. Enter a search word: "
  gets.chomp.downcase
end

def call_api_create_instances(user_input) #call api > pass to `new_from_api` & create Listing instances
  Listing.api_response(user_input)
end

def display_preview
  puts ""
  puts ""
  #puts "*************************************************"
  Listing.preview_all #display preview format of all instances
  #puts "*************************************************"
  #Listing.detailed_all #display detailed  format of all instances
  puts ""
  display_job_details()
end


def display_job_details()
  puts ""
  puts "________________________________"
  puts "What would you like to do next?" #type the  letter in [] of what you'd like to do next
  puts "________________________________"
  puts ""
  #puts "***********************************"
  puts "--> To See Details About a Specific Position, Type its Number. " #{}"Type The Number Of A Position To Learn More About It."

  # puts "To see details about all of the above positions, type: all "
      #type the number of a position to learn more about it
  puts "--> To Search a New Keyword, Type:  search"
  puts "--> To Leave My Lovely Program, Type:  exit"
  puts ""
  input2 = gets.chomp
  puts ""
  puts ""
    # [TO DO] validate
      # does this word return any search rresults?!?!?
        # if word: downcase, validate for downcase, TWO WORDS
        # if number: between 1-List.length?
        # else: not valid input, lets try this again display_selected()

  if input2 == "exit"
    return
  elsif input2 == "search"
    Listing.delete
    call()
  # elsif input2 == "all" # puts Listing.detailed_all
  elsif input2 == "2" # a number (bc already validating up above)
    #Listing.find_by_num("1")
    detailed_display("2")
    #number between 0 and Listing.length (validation)
    #full dissplay of this listing,
          # hmm decide later when and if to make a method here.
          # options to go back to start and enter keyword
          # exit
          # go back and select a different num - display_preview(input) (hmmm this wont persist, so Listing.preview_all)
  else
    puts ""
    puts "___________________________________"
    puts "Hmm, somethings not right."
    puts "Lets try again."
    puts "___________________________________"
    puts ""
    display_job_details()
  end
end

  def detailed_display(user_num)
    Listing.find_by_num(user_num) # finds object

    puts ""
    puts "_____________________________________"
    puts "  What would you like to do next?" #type the  letter in [] of what you'd like to do next
    puts "_____________________________________"
    puts ""
    puts "--> To Go Back and Enter a Different Number, Type:  menu" #type the number of a position to learn more about it
    puts "--> To Search a New Keyword, Type:  search"
    puts "--> To Leave My Lovely Program, Type:  exit"
    puts ""
    input3 = gets.chomp
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
      display_preview()
    end
  end

end
