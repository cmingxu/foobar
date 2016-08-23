class CreateImageAssets < ActiveRecord::Migration[5.0]
  def change
    create_table :image_assets do |t|
      t.string :file
      t.string :attachable_type
      t.integer :attachable_id

      t.timestamps
    end
  end
end
