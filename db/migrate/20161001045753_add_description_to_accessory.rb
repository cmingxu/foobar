class AddDescriptionToAccessory < ActiveRecord::Migration[5.0]
  def change
    add_column :accessories, :price, :integer
    add_column :accessories, :quanlity, :string
  end
end
