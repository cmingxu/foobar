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

class ConditionValue < ApplicationRecord
  include Pinyinable

  belongs_to :condition
  belongs_to :category

  scope :of_condition, lambda {|condition| where(condition_id: condition.id) }

  validates :name, uniqueness: { scope: :condition_id }

end
