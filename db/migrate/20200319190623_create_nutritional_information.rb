class CreateNutritionalInformation < ActiveRecord::Migration[5.0]
  def change
    create_table :nutritional_informations do |t|
      t.integer :amount
      t.integer :food_id
      t.integer :user_id 
    end
  end
end
