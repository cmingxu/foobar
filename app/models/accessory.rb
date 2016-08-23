class Accessory < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_many :accessory_conditions, dependent: :destroy
  has_many :conditions, through: :accessory_conditions

  has_many :image_assets, as: :attachable
  accepts_nested_attributes_for :image_assets
end
