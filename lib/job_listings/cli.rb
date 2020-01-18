# cli - controller

class JobListings::CLI

def call
  user_input = get_search_word # hold the og search word
  display_preview(user_input)
  display_selected()
end

def get_search_word
  puts "Discover open tech jobs in NY. Enter a search word: "
  input = gets.chomp.downcase
    # validations for user input
        # if (!" " || 2)
            # return input
        # else please type a keyword, and recall get_search_word
end


def display_preview(user_input)
  Listing.api_response(user_input)  #call api > pass to `new_from_api` & create Listing instances
  Listing.preview_all #display preview format of instances
end



# --> decide when/ if to make this a new method. or combine it into one.

def display_selected()
  puts "To learn more about a position type its number: "
  puts "To go back and search a new word type: back"
  puts "To leave my lovely program type: exit"

  input2 = gets.chomp

  if input2 == "exit"
    return
  elsif input2 == "back"
    Listing.delete
    call()
  elsif input2 == "1"
    Listing.find_by_num("1")
    #number between 0 and Listing.length (validation)
      # Listing.find_by_num(input2)
      # full dissplay of this listing,
          # hmm decide later when and if to make a method here.
          # options to go back to start and enter keyword
          # exit
          # go back and select a different num - display_preview(input) (hmmm this wont persist, so Listing.preview_all)
  else
    puts "Hmm, somethings not right."
    puts "Lets try again. "
    display_selected()
  end
end






end
