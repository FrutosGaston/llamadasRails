class CreateCalls < ActiveRecord::Migration[5.0]
  def change
    create_table :calls do |t|

      t.string :origin
      t.string :destiny
      t.datetime :when
      t.integer :last

      t.timestamps
    end
  end
end
