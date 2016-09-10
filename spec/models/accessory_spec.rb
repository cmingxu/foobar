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

require 'rails_helper'

RSpec.describe Accessory, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
