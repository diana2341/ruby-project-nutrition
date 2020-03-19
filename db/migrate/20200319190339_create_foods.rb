class CreateFoods < ActiveRecord::Migration[5.0]
  def change
    create_table :foods do |t|
      t.string :type
      t.string :calories
      t.string :carbs
      t.string :fat
    end
  end
end
