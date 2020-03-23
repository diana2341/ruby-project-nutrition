class Food < ActiveRecord::Base
    has_many :nutritions
    has_many :users, through: :nutritions
end