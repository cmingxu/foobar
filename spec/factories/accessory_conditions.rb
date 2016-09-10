# == Schema Information
#
# Table name: accessory_conditions
#
#  id                   :integer          not null, primary key
#  accessory_id         :integer
#  condition_id         :integer
#  condition_value_id   :integer
#  condition_value_name :string(255)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

FactoryGirl.define do
  factory :accessory_condition do
    accessory_id 1
    condition_id 1
    condition_value_id 1
    condition_value_name "MyString"
  end
end
