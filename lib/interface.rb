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
         sleep 1
         prompt.select "What do you want to do today?" do |menu|
             menu.choice "Login", -> {login_assist}
             menu.choice "Register", -> {register_assist}
            
     #      answer = STDIN.gets.chomp
    #      if answer == "login"
    #          login_assist
    #      elsif answer == "register"
    #          register_assist
    #      else
    #         warning_message
        
         end

     end

    def login_assist
        puts "You chose login"
        @user = User.login_helper
        
    
    end

     
    def register_assist
        puts "You chose register"
        @user = User.register
    end

    def warning_message
        puts "Yikes!"
    end

    def main_menu
        sleep 2
        puts "Welcome, #{@user.username}!"
        prompt.select "What do you want to do today?" do |menu|
            menu.choice "Show all fortunes", -> {show_all_fortunes_helper}
            menu.choice "Favorite a fortune!", -> {favorite_quote_helper}
            menu.choice "See my fortunes", -> {see_my_fortunes_helper} #works
            menu.choice "Delete saved fortunes", -> {delete_quote_helper}
            menu.choice "Daily fortune", -> {daily_fortune_helper}
            menu.choice "Exit app", -> {puts "peace"}
            
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
      
        bibble = Quote.find_by(title: answer) 
         
        if  answer = bibble
            UserFortune.create(user_id: @user.id, quote_id: bibble.id)
            puts "The future is in YOUR hands!"
        else 
            puts "We don't have that one....Un-fortunately : ("
        
        end
         main_menu
    
        end


        def delete_quote_helper
            # puts "Type the Title of your favorite fortune."
            # show_all_fortunes_helper
            # @quote = Quote.
        puts "***All Fortunes***"
            sleep 2
        Quote.display_all_quotes
            sleep 2
        puts "***Your Fortunes***"
            sleep 2
            @user.display_fortunes
            @user.reload
            sleep 1 
            puts "Type the title of the fortune you would like to delete"
            answer = STDIN.gets.chomp
          
            bibble = Quote.find_by(title: answer) 
             
            if  answer = bibble
                UserFortune.where(user_id: @user.id, quote_id: bibble.id).destroy_all
                puts "The future is in YOUR hands!"
            else 
                puts "You don't have that one, try again"
            
            end
             main_menu
        
            end

            def daily_fortune_helper
                daily_fortune = Quote.all.sample
                puts daily_fortune.affirmation

                puts "Would you like to save?"

                sleep 5

                favorite_quote_helper
            end 





    

    def run
        welcome
        ask_for_login_or_register
        main_menu
    end

end