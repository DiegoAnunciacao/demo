class CreateProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.decimal :price

      t.timestamps
    end
  end
end
