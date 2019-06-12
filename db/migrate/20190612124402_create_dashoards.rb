class CreateDashoards < ActiveRecord::Migration[5.2]
  def change
    create_table :dashoards do |t|

      t.timestamps
    end
  end
end
