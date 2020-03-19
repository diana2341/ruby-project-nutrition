class Food < ActiveRecord::Base
    has_many :nutritional_foods 
    has_many :users, though: :nutritional_foods
end