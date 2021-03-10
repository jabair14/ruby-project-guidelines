class Quote < ActiveRecord::Base
    has_many :user_fortunes 
    has_many :users, through: :user_fortunes 

    def self.display_all_quotes 
       Quote.all.each do |quote|
    
        puts "Fortune Title: #{quote.title}" 
        puts "Fortune: #{quote.affirmation}"
           
        # .affirmation
       end
       favorite_quote  
       binding.pry 
    end

    def favorite_quote
        puts "Type the title of your favorite fortune to save it!"
        if  quote.title == STDIN.gets.chomp
            UserFortune.create(user_id: user, quote_id: quote)
        else 
            puts "Sorry, that's not your fortune!"
        end
    
    end
end


    