class Quote < ActiveRecord::Base
    has_many :user_fortunes 
    has_many :users, through: :user_fortunes 

    # def show_all_quotes
    #     puts "show all quotes"
    #     # Quote.all.each do |n|
    #     #     puts n.affirmation == self 
    #     # end   
    # end
    # binding.pry 
end