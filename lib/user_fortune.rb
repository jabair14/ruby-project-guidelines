class UserFortune < ActiveRecord::Base
    belongs_to :user 
    belongs_to :quote 

    # def self.favorite
    #     # puts "Choose a Username."
    #     # username = STDIN.gets.chomp
    #     puts "Choose a favorite."
    #     show_all_fortunes_helper
    #     quote = STDIN.gets.chomp
    #     @user_fortune = UserFortune.create(user_id: user.id, quote_id: quote)

    # end
    # binding.pry 
end