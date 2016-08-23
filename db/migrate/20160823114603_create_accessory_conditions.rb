class CreateAccessoryConditions < ActiveRecord::Migration[5.0]
  def change
    create_table :accessory_conditions do |t|
      t.integer :accessory_id
      t.integer :condition_id
      t.integer :condition_value_id
      t.string :condition_value_name

      t.timestamps
    end
  end
end
