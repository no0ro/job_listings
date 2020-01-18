# cli - controller

class JobListings::CLI

def call
  user_input = get_search_word
  display_preview(user_input)
    #  search_again
end

def get_search_word
  puts "Discover open tech jobs in NY. Enter a search word: "
  gets.chomp.downcase
    # validations for user input
        # if (!" " || 2)
            # return input
        # else please type a keyword, and recall get_search_word
end

def display_preview(user_input)
  Listing.api_response(user_input)  #call api, create Listing instances
  Listing.preview_all #display preview format of instances

          ## puts
          # 1. Job Title
          # 2. Job Title

end




# --> decide when/ if to make this a new method. or combine it into one.

# def display_selected(input2)
    ## puts
    # type the # to learn more about the position
    # type back to research
    # exit to leave

    # grab user input2

    # if input2 == "exit"
      # return
    # elsif input2 == "back"
      # clear Listing .. Listing.delete
      # call()
    # elsif input2 == number between 0 and Listing.length (validation)
      # Listing.find_by_num(input2)
      # full dissplay of this listing,
          # hmm decide later when and if to make a method here.
          # options to go back to start and enter keyword
          # exit
          # go back and select a different num - display_preview(input) (hmmm this wont persist, so Listing.preview?)
    # else
      # puts - error, lets try this search_again
      # display_selected(input2)







end
