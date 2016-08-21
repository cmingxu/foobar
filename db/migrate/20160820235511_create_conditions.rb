class CreateConditions < ActiveRecord::Migration[5.0]
  def change
    create_table :conditions do |t|
      t.string :name
      t.string :category_id
      t.string :pinyin
      t.integer :position

      t.timestamps
    end
  end
end
