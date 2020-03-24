
require "tty-prompt"
require 'pry'
#require './options.rb'


class CommandLineInterface
def entrance
puts"»»————-————————————————　   ————————————————————————-««"
puts"(っ◔◡◔)っ 🍟𝘍𝘰𝘰𝘥 𝘥𝘪𝘢𝘳𝘺, 𝘬𝘦𝘦𝘱 𝘵𝘳𝘢𝘤𝘬 𝘰𝘧 𝘸𝘩𝘢𝘵 𝘺𝘰𝘶 𝘦𝘢𝘵!🍽 "
puts"»»————-————————————————　   ————————————————————————-««"
puts"           😎⁣🥓🍐🍌🍋🍋🍊🍊🌽🍎🥑🍎 🍑🥕🤤"
puts"           🍔 ______             _      🌯"
puts"           🥞(  /          /    //      🥩"
puts"           🌮 -/--__ __ __/    // __ _, 🥘"
puts"           🥗_/  (_)(_)(_/_   (/_(_)(_)_🍚"
puts"           🍪                       /|  🍜"
puts"           🍕                      (/   🎂"
puts"           😋🍋🍊🍎🍓🍇🍐🍏🥝🥒🍅 🥭🍍🍒🤩"

end
    
    def user_info(name,age,weight,password)
     User.find_or_create_by(name:@name_input,age: @age_input,weight:@weight_input, password: @password_input)
    end
    

    def signin_or_sign_up
        prompt = TTY::Prompt.new(symbols:{marker:"🥖"})
       @answer= prompt.select("would you like to log in or sign up")do |option|
        option.choice 'Log In'
        option.choice 'Sign Up'
    end
         if @answer== "Log In"
            user_log_in
         elsif @answer == "Sign Up"
            create_account              
         end
     end

    def create_account
        prompt = TTY::Prompt.new(symbols:{marker:"🥖"})

       @name_input= prompt.ask("What is your name?") do |q|
            q.required true
            q.validate /^[a-zA-Z\s]+$/
            q.messages[:valid?]="Ivalid name input"
            q.modify   :capitalize
          end

        @age_input= prompt.ask("What is your age?") do |q|
            q.required true
            q.validate /^[0-9]+$/
            q.messages[:valid?]="Must be a number"
          end

        @weight_input= prompt.ask("Enter your weight in lbs.") do |q|
            q.required true
            q.validate /^[0-9]+$/
            q.messages[:valid?]="Must be a number"
          end

        @password_input= prompt.ask("Create a password") do |q|
            q.required true
            q.validate /^[a-zA-Z0-9_.-]*$/
            q.messages[:valid?]="Must not contain any Symbols"
        end

            @user=user_info(@name_input, @age_input,@weight_input,@password_input)
            puts "Welcome to our food log app please continue by logging in"
            user_log_in
    end

    def user_log_in
        prompt = TTY::Prompt.new(symbols:{marker:"🥖"})
          puts"     |LOG IN|"
            puts"🍏━━━━━━━━━━━━━━━🍏"
            @name_input= prompt.ask("Enter name:") do |q|
                q.required true
                q.validate /^[a-zA-Z\s]+$/
                q.messages[:valid?]="Ivalid name input"
                q.modify   :capitalize
              end
              puts"🍏━━━━━━━━━━━━━━━🍏"

            @password_input= prompt.ask("Password:") do |q|
                q.required true
                q.validate /^[a-zA-Z0-9_.-]*$/
                q.messages[:valid?]="Must not contain any Symbols"
              end
              puts"🍏━━━━━━━━━━━━━━━🍏"

            if User.find_by(name:@name_input,password:@password_input)
                @make_food= prompt.select("would you like to make a food entry")do |option|
                option.choice 'Yes'
                option.choice 'No'  
            end
            puts"🍏━━━━━━━━━━━━━━━🍏"

            if @make_food == "Yes"
                create_food
                elsif @make_food =="No"
                    user_options
            end
             
            else 
                @make_account= prompt.select("Account not found, would you like to make an account?")do |option|
                option.choice 'Yes'
                option.choice 'No'
            end
               
                 if  @make_account == "Yes" 
                     create_account
                 else
                    puts "Thank you for visiting us,hope you'll consider joining us soon !"                                
            end
        end
    end
  
    def food_input(food_name,calories,carbs,fat)
       Food.find_or_create_by(food_name:food_name, calories:calories,carbs:carbs,fat:fat)
    end
   
    def create_food
        prompt = TTY::Prompt.new(symbols:{marker:"🥖"})
        @food_name= prompt.ask("Name of food:") do |q|
            q.required true
            q.validate /^[a-zA-Z\s]+$/
            q.messages[:valid?]="Ivalid name input"
            q.modify   :capitalize
        end
        @calories_input= prompt.ask("How many calories does it contain?") do |q|
            q.required true
            q.validate /^(0|[1-9]\d*)(\.\d+)?$/
            q.messages[:valid?]="Ivalid number input"
        end
            @carbs_input= prompt.ask("How many carbs does it contain?") do |q|
                q.required true
                q.validate /^(0|[1-9]\d*)(\.\d+)?$/ 
                q.messages[:valid?]="Ivalid number input"
            end
            
                @fat_input= prompt.ask("How much Fat does it contain?") do |q|
                    q.required true
                    q.validate /^(0|[1-9]\d*)(\.\d+)?$/
                    q.messages[:valid?]="Ivalid number input"
                end
           @food= food_input(@food_name,@calories_input,@carbs_input,@fat_input)
            user = User.find_by(name: user)
            amount=@amounts
            create_nutrition_instance(user,@food,amount)          
    end


    def create_nutrition_instance(user,food,amount)

 

         puts"How many #{@food_name}'s?"
        @amounts=gets.chomp
        Nutrition.find_or_create_by(amount:@amounts, food_id:@food.id, user_id:@user.id) 
    user_options
    end

    def exit 
    puts"╔═════════════════════════════ஓ๑🥦๑ஓ═════════════════════════════╗"
    puts"       Thank you for signing in #{@name_input}, sign in again soon!  "        
    puts"╚═════════════════════════════ஓ๑🥦๑ஓ═════════════════════════════╝"

    end
    def user_options
        prompt = TTY::Prompt.new(symbols:{marker:"🥖"})
        @user_option= prompt.select(" Choose next option")do |option|
            option.choice 'Make another entry'
            option.choice 'Show my history'
            option.choice 'My information'
            option.choice 'Update account'
            option.choice 'Exit'
    end
        user=@user
            if @user_option=='Show my history'
                food_log_history
            elsif @user_option=='My information'
                display_info
            elsif @user_option=="Make another entry"
                create_food
                elsif @user_option =='Update account'
                    update_account(user)
                elsif @user_option=="Exit"
                    exit

        end
    end
    def display_info
        puts "🥖Name #{@name_input}"
        puts "🥖Age #{@age_input}" 
        puts "🥖Weight #{@weight_input}"
        puts "🥖password #{@password_input}"   
        user_options       
    end
   
   

    def update_account(user)
        prompt = TTY::Prompt.new(symbols:{marker:"🥖"})
        @update_option= prompt.select("Choose what to update")do |option|
        #option.choice 'password'
        option.choice 'weight'
       
        end
           # if @update_option== 'password'
                #update_password(user)
            if @update_option=='weight'
                update_weight(user)
            end
    end

    # def update_password(user)#has to update
    #         puts "Enter new password"
    #         new_password_input=gets.chomp
    #      @password_input=new_password_input
    #      puts "password updated!"     
    #     user_options
    # end

    def update_weight(user)#has to update
            "Update you weight"
        new_weight_input=gets.chomp
            
         @weight_input=new_weight_input
         puts "***Weight updated, choose another option***"
         user_options
        
    
    end
   
    def food_log_history
       User.last.foods.map do |info| 
             puts "This #{info.food_name}"
             puts"contains #{info.calories} calories, #{info.carbs} grams of carbs and #{info.fat} grams of fat"        
        end       
        user_options
    end

    def delete_account
        User.last.delete
    end

    #total up calorie count
        
end