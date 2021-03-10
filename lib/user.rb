class User < ActiveRecord::Base
    has_many :user_fortunes 
    has_many :quotes, through: :user_fortunes 
    

    def self.login_helper
        puts "Input Username."
        username = STDIN.gets.chomp
        puts "Input Password."
        password = STDIN.gets.chomp
        @user = User.find_by(username: username, password: password)

        until @user
            puts "Incorrect username or password"
            @user = User.login_helper
        end
        @user 
    end

    def self.register
        puts "Choose a Username."
        username = STDIN.gets.chomp
        puts "Choose a Password."
        password = STDIN.gets.chomp
        @user = User.create(username: username, password: password)
    end


    def display_fortunes 
        # puts "Your fortunes here!"
        self.quotes.each do |quote|
            puts quote.affirmation
           
        end
        # binding.pry 

        # if quotes.length > 0

        #     array_of_hashes = quotes.map do |quotes|
        # #         # The key of the hash is what gets shown
        # #         # The value of the hash is what gets saved
        #         {quotes.affirmation => quotes.id}
        #     end
        # end

        # #     post_id = TTY::Prompt.new.select("What post do you want to see more info?", array_of_hashes)
        # #     puts "You chose post with ID of #{post_id}"
        # # else
        # #     puts "You don't have any posts sorry"
        # # end
    end

    #binding.pry 
end