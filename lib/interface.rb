require 'rainbow'
class Interface

    attr_accessor :user, :quote, :user_fortune
    attr_reader :prompt

    def initialize
        @prompt = TTY::Prompt.new
    end

    def welcome 
       system 'clear'
        puts Rainbow("W.").red
        sleep 0.3
        system 'clear'
        puts Rainbow("W").orange 
        sleep 0.3
        system 'clear'
        puts Rainbow("W.").white
        sleep 0.3
        system 'clear'
        puts Rainbow("We").red
        sleep 0.3
        system 'clear'
        puts Rainbow("Wel").orange
        sleep 0.3
        system 'clear'
        puts Rainbow("Welc").white
        sleep 0.3
        system 'clear'
        puts Rainbow("Welco").red
        sleep 0.3
        system 'clear'
        puts Rainbow("Welcom").orange
        sleep 0.3
        system 'clear'
        puts Rainbow("Welcome").white
        sleep 0.3
        system 'clear'
        puts Rainbow("Welcome.").red
        sleep 0.3
        system 'clear'
        puts Rainbow("Welcome").orange
        sleep 0.3
        system 'clear'
        puts Rainbow("Welcome.").white
        sleep 0.3
        system 'clear'
        puts Rainbow("Welcome.").red
        sleep 0.3
        system 'clear'
        puts Rainbow("Welcome").orange 
        sleep 0.3
        system 'clear'
        puts Rainbow("Welcome.").white 
        sleep 0.3
        system 'clear'
        puts Rainbow("Welcome.").red
        sleep 0.3
        system 'clear'
        puts Rainbow("Welcome").orange
        sleep 0.3
        system 'clear'
        puts Rainbow("Welcome.").white
        sleep 3
        system 'clear'
        puts Rainbow("This app will help you find & turn quotes into Some Fire!").red
        sleep 2
        system 'clear'
        puts Rainbow("This app will help you find & turn quotes into Some Fire!").orange
        sleep 2
        system 'clear'
        puts Rainbow("This app will help you find & turn quotes into Some Fire!").white
        sleep 2
        system 'clear'
        puts Rainbow("This app will help you find & turn quotes into Some Fire!").red 
        sleep 2
        system 'clear'
        puts " "
    end

    def ask_for_login_or_register
        system 'clear' 
        puts "Would you like to login or register?"
         sleep 4
         puts " "
         system 'clear'
         prompt.select "What do you want to do today?" do |menu|
             menu.choice "Login", -> {login_assist}
             menu.choice "or", -> {why}
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

     def why
        system 'clear'
        puts "Cmon fam, why even click this"
        sleep 2
        ask_for_login_or_register
     end

    def login_assist
        system 'clear'
        puts "You chose login"
        sleep 2
       puts " "
        @user = User.login_helper
        
    
    end

     
    def register_assist
        system 'clear'
        puts "You chose register"
        puts " "
       sleep 2
        @user = User.register
    end

    def warning_message
        system 'clear'
        puts "Yikes!"
    end

    def main_menu
        system 'clear'
        
        puts "Welcome back, #{@user.username}!"
        sleep 2
        system 'clear'
        prompt.select "What do you want to do today?" do |menu|
            menu.choice "Show all quotes", -> {show_all_fortunes_helper}
            menu.choice "Make a quote Some Fire!", -> {favorite_quote_helper}
            menu.choice "Some Fire!", -> {see_my_fortunes_helper} #works
            menu.choice "Delete some fire", -> {delete_quote_helper}
            menu.choice "Surprise me!", -> {daily_fortune_helper}
            menu.choice "Exit app", -> {puts "peace"}
            
        end
    end


    def show_all_fortunes_helper
        system 'clear'
        Quote.display_all_quotes 
        # favorite 
        sleep 5
        system 'clear'
        puts "Dont forget, if you see a quote you like, you can use the LOWKEY to make it Some Fire!"
        sleep 5
        main_menu
        
    end


    def see_my_fortunes_helper
       system 'clear'
        @user.display_fortunes
        sleep 5 
        system 'clear'
        puts "Had enough of a quote? Delete it!"
        sleep 5 
        main_menu
    end

    def favorite_quote_helper
        # puts "Type the Title of your favorite fortune."
        # show_all_fortunes_helper
        # @quote = Quote.
        system 'clear'
        Quote.display_all_quotes 
        @user.reload
        puts " "
        sleep 2 
        puts "Type the LOWKEY to make a quote Some Fire!"
        puts " "
        answer = STDIN.gets.chomp
      
        bibble = Quote.find_by(title: answer) 
         
        if  answer = bibble
            UserFortune.create(user_id: @user.id, quote_id: bibble.id)
            puts " "
            system 'clear'
            puts "I felt that one too!"
            sleep 3
        else 
            system 'clear'
            puts "Not sure about that one champ"
        sleep 3 
        end
         main_menu
    
        end


        def delete_quote_helper
            # puts "Type the Title of your favorite fortune."
            # show_all_fortunes_helper
            # @quote = Quote.
            system 'clear'
            puts "All Quotes"
            sleep 2
        puts " "
            Quote.display_all_quotes
            sleep 2
    puts " "    
        puts "Some Fire"
        puts " "    
        sleep 2
            @user.display_fortunes
            @user.reload
            sleep 1 
            puts " "
            puts "Type the LOWKEY of the quote you would like to delete"
            answer = STDIN.gets.chomp
          
            bibble = Quote.find_by(title: answer) 
             
            if  answer = bibble
                UserFortune.where(user_id: @user.id, quote_id: bibble.id).destroy_all
                system 'clear'
                puts "It's outta there!"
                sleep 2
                system 'clear'
                puts "Feeling uninspired? Try Surprise me!"
                sleep 3
            else 
                system 'clear'
                puts "You don't have that one, try again"
            sleep 2
            end
             main_menu
        
            end

            def daily_fortune_helper
                system 'clear'
                daily_fortune = Quote.all.sample
                puts daily_fortune.affirmation
                sleep 5
                puts " "
                puts "Would you like to save?"

                sleep 5
                puts " "

                favorite_quote_helper
            end 





    

    def run
        welcome
        ask_for_login_or_register
        main_menu
    end

end