# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  pinyin     :string(255)
#  parent_id  :integer
#  lft        :integer
#  rgt        :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ApplicationRecord
  acts_as_paranoid

  has_many :entities
  has_many :conditions
  has_many :condition_values

  validates :name, presence: { message: '分类名称不能空' }
  validates :name, uniqueness: { scope: :parent_id, message: '分类名称不能重复' }
end

