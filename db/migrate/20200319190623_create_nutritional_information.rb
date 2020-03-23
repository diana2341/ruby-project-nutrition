class CreateNutritionalInformation < ActiveRecord::Migration[5.0]
  def change
    create_table :nutritional_informations do |t|
      t.integer :food_id
      t.integer :user_id 
      t.integer :amount

    end
  end
end
