# == Schema Information
#
# Table name: accessory_conditions
#
#  id                   :integer          not null, primary key
#  accessory_id         :integer
#  condition_id         :integer
#  condition_value_id   :integer
#  condition_value_name :string(255)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

require 'rails_helper'

RSpec.describe AccessoryCondition, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
