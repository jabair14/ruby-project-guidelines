class Quote < ActiveRecord::Base
    has_many :user_fortunes 
    has_many :users, through: :user_fortunes 

    def self.display_all_quotes 
       Quote.all.each do |quote|
    
        puts Rainbow("LOWKEY: #{quote.title}").white
        puts Rainbow("QUOTE: #{quote.affirmation}").orange
        puts ""
           
        # .affirmation
       end
        
       
    end

    # def self.quote_help

    #     Quote.all.sample = quote
    
    #     puts quote
    #     #binding.pry 
    # end
    
end


    