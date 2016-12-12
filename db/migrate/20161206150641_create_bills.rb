class CreateBills < ActiveRecord::Migration[5.0]
  def change
    create_table :bills do |t|
      t.datetime :since
      t.datetime :till
      t.references :biller, foreign_key: true

      t.timestamps
    end
  end
end
