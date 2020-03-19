class User < ActiveRecord::Base
    has_many :nutritional_foods 
    has_many foods, through: :nutritional_foods
end