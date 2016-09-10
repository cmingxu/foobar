# == Schema Information
#
# Table name: image_assets
#
#  id              :integer          not null, primary key
#  file            :string(255)
#  attachable_type :string(255)
#  attachable_id   :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

FactoryGirl.define do
  factory :image_asset do
    file "MyString"
  end
end
