class AddGeoInfoToUser < ActiveRecord::Migration[5.0]
  def change
    %w(province province_code city city_code region region_code).each do |what|
      add_column :users, what, :string
    end
  end
end
