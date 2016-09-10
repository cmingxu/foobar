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

require 'rails_helper'

RSpec.describe Condition, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
