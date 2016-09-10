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

class Accessory < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_many :accessory_conditions, dependent: :destroy
  has_many :conditions, through: :accessory_conditions

  has_many :accessory_condition_values, dependent: :destroy
  has_many :condition_values, through: :accessory_condition_values

  has_many :image_assets, as: :attachable
  accepts_nested_attributes_for :image_assets

  def title
    [self.category_name || self.category.try(:name), self.count].join " "
  end
end
