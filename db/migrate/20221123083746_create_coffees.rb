class CreateCoffees < ActiveRecord::Migration[7.0]
  def change
    create_table :coffees do |t|
      t.string :name
      t.string :size
      t.integer :price

      t.timestamps
    end
  end
end
