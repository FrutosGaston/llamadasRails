class CreateBills < ActiveRecord::Migration[5.0]
  def change
    create_table :bills do |t|
      t.datetime :since
      t.datetime :till

      t.timestamps
    end
  end
end
