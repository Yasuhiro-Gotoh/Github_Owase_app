class Riyosya < ApplicationRecord
    validates :riyosyaId,:simei, {presence: true}
    #belongs_to :sankas, :foreign_key => 'riyosyaId'
end
