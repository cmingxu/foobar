class AccessoryCondition < ApplicationRecord
  belongs_to :accessory
  belongs_to :condition
end
