class CreateAccessories < ActiveRecord::Migration[5.0]
  def change
    create_table :accessories do |t|
      t.string :name
      t.integer :count
      t.integer :category_id
      t.string :category_name
      t.integer :user_id
      t.string :state

      t.timestamps
    end
  end
end
