
require "tty-prompt"
require 'pry'

class CommandLineInterface

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

                if @user_option=='Show my history'
                    food_log_history
                elsif @user_option=="Make another entry"
                    create_food
                    elsif @user_option =='Update account'
                        update_account
                    elsif @user_option=="Exit"
                        exit

            end
        end

       
       

        def update_account
            prompt = TTY::Prompt.new
            @update_option= prompt.select("Choose what to update")do |option|
            option.choice 'password'
            option.choice 'weight'
           
            end
                if @update_option== 'password'
                    update_password
                elsif @update_option=='weight'
                    update_weight
                end
        end

        def update_password#has to update

            prompt = TTY::Prompt.new

            new_password_input= prompt.ask("Enter new password:") do |q|
                q.required true
                q.validate /^[a-zA-Z0-9_.-]*$/
                q.messages[:valid?]="Must not contain any Symbols"
              end
             new_password_input=@password_input
             puts "***password updated please sign in again***"
             user_log_in

        end

        def update_weight#has to update
            prompt = TTY::Prompt.new

            new_weight_input= prompt.ask("Update you weight:") do |q|
                q.required true
                q.validate /^(0|[1-9]\d*)(\.\d+)?$/
                q.messages[:valid?]="Must be a number"
              end
             new_weight_input=@weight_input
             puts "***Weight updated, choose another option***"
             user_options
            
        
        end
       
       
      

        def food_log_history#shows history of specofic person
            history = Food.all.map {|info|info}
            history.map do |info|
                 puts "This #{info.food_name}"
                 puts"contains #{info.calories} calories, #{info.carbs} grams of carbs and #{info.fat} grams of fat"
            
            end
            
            user_options
        end
        #total up calorie count
       #find a way to destroy entries after user exits
    #    def run_application
    #     user=@user_instance
    #    # signin_or_sign_up
    #    our_nutrition_facts
    #    end
       
end
