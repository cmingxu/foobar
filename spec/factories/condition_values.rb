# == Schema Information
#
# Table name: condition_values
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  category_id  :integer
#  condition_id :integer
#  pinyin       :string(255)
#  position     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryGirl.define do
  factory :condition_value do
    name "MyString"
    category_id "MyString"
    pinyin "MyString"
    position 1
  end
end
