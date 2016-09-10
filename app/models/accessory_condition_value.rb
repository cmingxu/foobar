class AccessoryConditionValue < ApplicationRecord
  belongs_to :accessory
  belongs_to :condition
  belongs_to :condition_value
end
