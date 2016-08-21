class Condition < ApplicationRecord
  has_many :condition_values
  belongs_to :category

  validates :name, uniqueness: { scope: :category_id }
end
