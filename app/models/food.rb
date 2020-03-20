class Food < ActiveRecord::Base
    has_many :nutritional_informations
    has_many :users, through: :nutritional_informations
end