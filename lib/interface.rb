class Interface

    attr_accessor :user, :quote, :user_fortune
    attr_reader :prompt

    def initialize
        @prompt = TTY::Prompt.new
    end

    def welcome 
        puts "Welcome."
        puts "This app will help you find your fortune"
    end

    def ask_for_login_or_register
         puts "Would you like to login or register?"
       
         answer = STDIN.gets.chomp
         if answer == "login"
             login_assist
         elsif answer == "register"
             register_assist
         else
            warning_message
        
        end


        # prompt.select "Would you like to login or register" do |menu|
        #     menu.choice "Login", -> { login_helper }
        #     menu.choice "Register", -> {register_helper}
        #end





    end

    def login_assist
        puts "You chose login"
        @user = User.login_helper
        #binding.pry 
    
    end

     
    def register_assist
        puts "You chose register"
        @user = User.register
    end

    def warning_message
        puts "Yikes!"
    end

    def main_menu
        # @user.reload
        # system 'clear'
        sleep 2
        puts "Welcome, #{@user.username}!"
        prompt.select "What do you want to do today?" do |menu|
            #menu.choice "See all categories", -> {see_all_categories_helper}
            menu.choice "See my fortunes", -> {see_my_fortunes_helper} #works
            menu.choice "Show all fortunes", -> {show_all_fortunes_helper}
            menu.choice "Exit app", -> {puts "peace"}
            menu.choice "Favorite a fortune!", -> {favorite_quote_helper}
        end
    end


    def show_all_fortunes_helper
        
        Quote.display_all_quotes 
        # favorite 
        main_menu
        
    end


    def see_my_fortunes_helper
        @user.display_fortunes
        
        main_menu
    end

    def favorite_quote_helper
        # puts "Type the Title of your favorite fortune."
        # show_all_fortunes_helper
        # @quote = Quote.
        Quote.display_all_quotes 
        @user.reload
        sleep 2 
        puts "Type the title of your favorite fortune to add to favorites."
        answer = STDIN.gets.chomp
        if answer == "Water"
            UserFortune.create(user_id: @user, quote_id: @quote)
            puts "The future is in YOUR hands!"
        else
            puts "We don't have that one....Un-fortunately : ("
        end
        
        main_menu
    
    end



    # def see_all_categories_helper

    # end




    def run
        welcome
        ask_for_login_or_register
        main_menu
    end

end