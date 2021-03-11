class UserFortune < ActiveRecord::Base
    belongs_to :user 
    belongs_to :quote 
    

    # def self.favorite_quote
    #     puts "Type the Title of your favorite fortune."
    #     answer = STDIN.gets.chomp
    #     if answer == quote.title 
    #         UserFortune.create(user_id: user, quote_id: quote)
    #     else
    #         puts "Sorry that is not your fortune!"
    #     end

    # end
      # puts "Type the title of your favorite fortune to save it!"
        # if  Quote.title == STDIN.gets.chomp
        #     UserFortune.create(user_id: user, quote_id: quote)
        # else 
        #     puts "Sorry, that's not your fortune!"
        # end
    
end