class CreateBillers < ActiveRecord::Migration[5.0]
  def change
    create_table :billers do |t|
      t.string :cost_types

      t.timestamps
    end
  end
end
