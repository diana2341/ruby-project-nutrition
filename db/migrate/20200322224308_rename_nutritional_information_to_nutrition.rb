class RenameNutritionalInformationToNutrition < ActiveRecord::Migration[6.0]
  def change
    rename_table :nutritional_informations, :nutritions
  end
end
