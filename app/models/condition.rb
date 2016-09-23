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

class Condition < ApplicationRecord
  include Pinyinable

  has_many :condition_values
  has_many :accessory_conditions
  has_many :accessories, through: :accessory_conditions, dependent: :destroy
  belongs_to :category

  validates :name, uniqueness: { scope: :category_id }

end
