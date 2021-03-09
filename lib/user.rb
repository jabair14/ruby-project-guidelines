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

    binding.pry 
end