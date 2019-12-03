class Sanka < ApplicationRecord
    validates :courseId, {presence: true}
    validates :riyosyaId, presence: true, uniqueness: {scope: :courseId}
    has_many :riyosyas, :foreign_key => 'riyosyaId'
    
end
