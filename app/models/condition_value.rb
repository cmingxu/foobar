class ConditionValue < ApplicationRecord
  belongs_to :condition
  belongs_to :category


  validates :name, uniqueness: { scope: :condition_id }
end
