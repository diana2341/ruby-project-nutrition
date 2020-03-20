

class CommandLineInterface

    
        def user_info(name,age,weight,password)
            @user =User.find_or_create_by(name: name,age: age,weight:weight, password: password)
        end
        
        def signin_or_sign_up  
            puts "would you like to log in or sign up"
             @answer=gets.chomp
             if @answer== "log in"
                user_log_in
             elsif @answer == "sign up"
                create_account
             end
            
        end

        def create_account
            puts "please enter name"
            @name_input=gets.chomp

            puts"please enter your age"
            @age_input=gets.chomp

            puts "enter weight"
            @weight_input=gets.chomp

        puts "create a password, must contain ONLY numbers"
            @password_input=gets.chomp
            user_info(@name_input, @age_input,@weight_input,@password_input)
        end

        def user_log_in
         
              puts" |LOG IN|"
                  puts "-----------"
                puts "enter name"
                @name_input=gets.chomp
                puts"enter password"
                @password_input=gets.chomp

            

        end

        def food_input
            nutrition=Food.find_or_create_by(type:type, calories:calories,carbs:carbs,fat:fat)


        end
        def create_food
        end

        def food_nutrition_info
            information=NutritionalInformation.create(amount:amount, food_id:food_id, user_id:user_id)
        end

       
end
