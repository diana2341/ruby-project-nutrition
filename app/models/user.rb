class User < ActiveRecord::Base
    has_many :nutritional_informations
    has_many :foods, through: :nutritional_informations
end