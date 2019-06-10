class CreateFlats < ActiveRecord::Migration[5.2]
  def change
    create_table :flats do |t|
      t.string :title
      t.text :description
      t.string :address
      t.integer :price
      t.integer :guests_nr
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
