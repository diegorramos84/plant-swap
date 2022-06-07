class CreatePlants < ActiveRecord::Migration[7.0]
  def change
    create_table :plants do |t|
      t.string :category
      t.string :type
      t.string :botanical_name
      t.string :common_name
      t.text :description
      t.string :light_conditions
      t.integer :mature_height
      t.integer :quantity
      t.boolean :indoor
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
