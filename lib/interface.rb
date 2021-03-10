class Interface

    attr_accessor :username
    # attr_reader :prompt

    # def initialize
    #     @prompt = TTY::Prompt.new
    # end
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
        @user = User.register_method
    end

    def warning_message
        puts "Yikes!"
    end

    def main_menu
        @user.reload
        system 'clear'
        sleep 2
        puts "Welcome, #{@user.username}!"
        prompt.select "What do you want to do today?" do |menu|
            #menu.choice "See all categories", -> {see_all_categories_helper}
            menu.choice "See my quotes", -> {see_my_quotes_helper}
            menu.choice "View and save quotes", -> {save_quote}
            menu.choice "Exit app", -> {puts "peace"}
        end
    end


    def save_quote
        # Post.create(...)
    end


    def see_my_posts_helper
        @user.display_quotes
        main_menu
    end



    def see_all_categories_helper

    end




    def run
        welcome
        ask_for_login_or_register
        #main_menu
    end

end