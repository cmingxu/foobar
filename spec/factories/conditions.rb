# == Schema Information
#
# Table name: conditions
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  category_id :string(255)
#  pinyin      :string(255)
#  position    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :condition do
    name "MyString"
    category_id "MyString"
    pinyin "MyString"
    position 1
  end
end
