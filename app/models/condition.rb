class Condition < ApplicationRecord
  has_many :condition_values
  has_many :accessory_conditions
  has_many :accessories, through: :accessory_conditions, dependent: :destroy
  belongs_to :category

  validates :name, uniqueness: { scope: :category_id }
end
