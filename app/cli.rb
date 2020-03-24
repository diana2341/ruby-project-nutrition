
require "tty-prompt"
require 'pry'
#require './options.rb'


class CommandLineInterface

    
    def user_info(name,age,weight,password)
     User.find_or_create_by(name:@name_input,age: @age_input,weight:@weight_input, password: @password_input)
    end
    

    def signin_or_sign_up
        prompt = TTY::Prompt.new
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
        prompt = TTY::Prompt.new

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
        prompt = TTY::Prompt.new
          puts" |LOG IN|"
              puts "-----------"

            @name_input= prompt.ask("Enter name:") do |q|
                q.required true
                q.validate /^[a-zA-Z\s]+$/
                q.messages[:valid?]="Ivalid name input"
                q.modify   :capitalize
              end
          
            @password_input= prompt.ask("Password:") do |q|
                q.required true
                q.validate /^[a-zA-Z0-9_.-]*$/
                q.messages[:valid?]="Must not contain any Symbols"
              end
            if User.find_by(name:@name_input,password:@password_input)
                @make_food= prompt.select("would you like to make a food entry")do |option|
                option.choice 'Yes'
                option.choice 'No'  
            end
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
        prompt = TTY::Prompt.new
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
            #user_options
            user = User.find_by(name: user)
            amount=@amounts


            create_nutrition_instance(user,@food,amount)
           
    end


    def create_nutrition_instance(user,food,amount)

 

         puts"How many #{@food_name}'s?"
        @amounts=gets.chomp
        Nutrition.find_or_create_by(amount:@amounts, food_id:@food.id, user_id:@user.id) 

            # food_nutrition_info(@food,@user,@amounts)
    user_options
    end

    def exit 
        puts"-------------------------------------------------------"
             puts"thank you for signing in #{@name_input}, sign in again soon!  "
        puts"-------------------------------------------------------"

    end
    def user_options
        prompt = TTY::Prompt.new
        @user_option= prompt.select(" Choose next option")do |option|
            option.choice 'Make another entry'
            option.choice 'Show my history'
            option.choice 'Update account'
            option.choice 'Exit'
    end
        user=@user
            if @user_option=='Show my history'
                food_log_history(user)
            elsif @user_option=="Make another entry"
                create_food
                elsif @user_option =='Update account'
                    update_account(user)
                elsif @user_option=="Exit"
                    exit

        end
    end

   
   

    def update_account(user)
        prompt = TTY::Prompt.new
        @update_option= prompt.select("Choose what to update")do |option|
        option.choice 'password'
        option.choice 'weight'
       
        end
            if @update_option== 'password'
                update_password(user)
            elsif @update_option=='weight'
                update_weight(user)
            end
    end

    def update_password(user)#has to update
       # if User.find_by(name:@name_input,password:@password_input)
            puts "Enter new password"
            new_password_input=gets.chomp

         user.password=new_password_input
         puts "***password updated please sign in again***"
         
         user_log_in

    end

    def update_weight(user)#has to update
        prompt = TTY::Prompt.new

        new_weight_input= prompt.ask("Update you weight:") do |q|
            q.required true
            q.validate /^(0|[1-9]\d*)(\.\d+)?$/
            q.messages[:valid?]="Must be a number"
          end
         @weight_input=new_weight_input
         puts "***Weight updated, choose another option***"
         user_options
        
    
    end
   
   
  #RETURNS ALL FOODS

    def food_log_history#shows history of specofic person
       # user=@user
        history = Food.all.map {|food|food}#_id==user.id}
        history.map do |info|
             puts "This #{info.food_name}"
             puts"contains #{info.calories} calories, #{info.carbs} grams of carbs and #{info.fat} grams of fat"
        
        end
        
        user_options
    end


    # #this method returns NOTHING******************
    # def food_log_history(user)#shows history of specofic person
    #     #
    #     # find the user
    #     # want a list of all of the user's foods
    #    # user.foods
    #     # iterate through that list of foods and print statements to the console
    #      User.all.map{|food|food.foods}
    #      #history = Nutrition.select {|food|food_id==food.id}
    #     #  User.all.map do|user|
    #     #     user.foods.map do |food|
    #     #       puts "This #{food.food_name}"
    #     #       puts"contains #{food.calories} calories, #{food.carbs} grams of carbs and #{food.fat} grams of fat"
    #     #  end
    #     # end
         
    #    #  user_options
    #  end
    #total up calorie count
   #find a way to destroy entries after user exits
#    def run_application
#     user=@user_instance
#    # signin_or_sign_up
#    our_nutrition_facts
#    end
   
        
end