class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :pais
      t.string :ciudad

      t.timestamps
    end
  end
end
