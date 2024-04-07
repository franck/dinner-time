class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.string :name, null: false, index: { unique: true }
      t.text :ingredients
      t.string :locale

      t.timestamps
    end
  end
end
