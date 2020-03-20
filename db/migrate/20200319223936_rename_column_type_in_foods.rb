class RenameColumnTypeInFoods < ActiveRecord::Migration[6.0]
  def change
    rename_column :foods ,:type , :food_name
    
  end
end
