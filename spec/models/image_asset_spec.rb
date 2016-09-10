# == Schema Information
#
# Table name: image_assets
#
#  id              :integer          not null, primary key
#  file            :string(255)
#  attachable_type :string(255)
#  attachable_id   :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe ImageAsset, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
