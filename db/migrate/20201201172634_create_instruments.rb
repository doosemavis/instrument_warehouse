class CreateInstruments < ActiveRecord::Migration[6.0]
  def change
    create_table :instruments do |t|
      t.string :name
      t.float :price
      t.integer :weight
      t.text :description
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
  end
end
