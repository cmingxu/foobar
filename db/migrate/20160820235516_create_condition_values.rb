class CreateConditionValues < ActiveRecord::Migration[5.0]
  def change
    create_table :condition_values do |t|
      t.string :name
      t.integer :category_id
      t.integer :condition_id
      t.string :pinyin
      t.integer :position

      t.timestamps
    end
  end
end
