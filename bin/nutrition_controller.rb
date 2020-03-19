def create_account(name,password)
    user =User.find_or_create_by(name: name,age: age,weight:bweight, password: password)
end
def user_log_in

end

def food_info
    nutrition=Food.find_or_create_by(type:type, calories:calories,carbs:carbs,fat:fat)

end
