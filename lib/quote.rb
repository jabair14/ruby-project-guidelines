class Quote < ActiveRecord::Base
    has_many :user_fortunes 
    has_many :users, through: :user_fortunes 

    def self.display_all_quotes 
       Quote.all.each do |quote|
    
        puts "Fortune Title: #{quote.title}" 
        puts "Fortune: #{quote.affirmation}"
           
        # .affirmation
       end
        
       
    end

    # def self.quote_help

    #     Quote.all.sample = quote
    
    #     puts quote
    #     #binding.pry 
    # end
    
end


    