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

require 'rails_helper'

RSpec.describe ConditionValue, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
