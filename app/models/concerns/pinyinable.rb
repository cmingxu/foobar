module Pinyinable
  extend ActiveSupport::Concern

  included do
    validates :pinyin, uniqueness: true
    before_save do
      self.pinyin = PinYin.permlink self.name
    end
  end
end
