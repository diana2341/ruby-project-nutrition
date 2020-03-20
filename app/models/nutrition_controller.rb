def create_account(name,age,weight,password)
    user =User.find_or_create_by(name: name,age: age,weight:weight, password: password)
end

def get_personal_info
    puts "please enter name"
    @name_input=gets.chomp

    puts"please enter your age"
    @age_input=gets.chomp

    puts "enter weight"
    @weight_input=gets.chomp

   puts "create a password, must contain ONLY numbers"
    @password_input=gets.chomp
    create_account(@name_input, @age_input,@weight_input,@password_input)
end

def user_log_in(name,password)
    if create_account(name,age,weight,password)
    login=User.where({ :name => ?, :password => ? })
    else  create_account(name,age,weight,password)



end

def food_input
    nutrition=Food.find_or_create_by(type:type, calories:calories,carbs:carbs,fat:fat)

end

def food_nutrition_info
    information=NutritionalInformation.create(amount:amount, food_id:food_id, user_id:user_id)
end

def run_application 
    create_account(name,age,weight,password)
end
