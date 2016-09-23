# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  pinyin     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  deleted_at :datetime
#

class Category < ApplicationRecord
  include Pinyinable
  
  acts_as_paranoid

  has_many :entities
  has_many :conditions
  has_many :condition_values

  validates :name, presence: { message: '分类名称不能空' }
end

