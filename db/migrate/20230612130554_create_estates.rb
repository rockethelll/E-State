class CreateEstates < ActiveRecord::Migration[7.0]
  def change
    create_table :estates do |t|
      t.string :title
      t.integer :price
      t.text :description
      t.integer :area
      t.integer :rooms
      t.boolean :furnished

      t.belongs_to :user

      t.timestamps
    end
  end
end
