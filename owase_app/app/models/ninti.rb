class Ninti < ApplicationRecord
    validates :riyosyaId, {presence: true}
    validates :kirokuYmd, presence: true, uniqueness: {scope: :riyosyaId}
end
