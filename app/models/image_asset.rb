class ImageAsset < ApplicationRecord
  mount_uploader :file, FileUploader
end
