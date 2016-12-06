class CreateBills < ActiveRecord::Migration[5.0]
  def change
    create_table :bills do |t|
      t.datetime :since
      t.datetime :until
      t.integer :amount
      t.references :calls
      t.references :biller, foreign_key: true

      t.timestamps
    end
  end
end
