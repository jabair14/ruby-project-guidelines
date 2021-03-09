class User < ActiveRecord::Base
    has_many :user_fortunes 
    has_many :quotes, through: :user_fortunes 
    

    def get_all_fortunes
        self.quotes.each do |quote|
            put quote.all 
        end
        

    end

#     binding.pry 
end