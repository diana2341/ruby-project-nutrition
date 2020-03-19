class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name 
      t.integer :age 
      t.integer :weight
      t.integer :password
    end
  end
end
