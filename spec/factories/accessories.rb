# == Schema Information
#
# Table name: accessories
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  count         :integer
#  category_id   :integer
#  category_name :string(255)
#  user_id       :integer
#  state         :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

FactoryGirl.define do
  factory :accessory do
    name "MyString"
    count 1
    category_id 1
    category_name "MyString"
    user_id 1
    state "MyString"
  end
end
