class User < ActiveRecord::Base
    has_many :user_fortunes 
    has_many :quotes, through: :user_fortunes 
    

    def self.login_helper
        puts "What is your username"
        username = STDIN.gets.chomp
        puts "What is your password?"
        password = STDIN.gets.chomp
        user_inst = User.find_by(username: username, password: password)

        until user_int
            puts "Incorrect username or password"
            user_inst = User.login_helper
        end
        user_inst
    end

    binding.pry 
end