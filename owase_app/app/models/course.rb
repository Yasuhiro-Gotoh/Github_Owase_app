class Course < ApplicationRecord
    validates :name, :zissiYmd, {presence: true}
    mount_uploader :syasin1, ImageUploader
    mount_uploader :syasin2, ImageUploader
end
