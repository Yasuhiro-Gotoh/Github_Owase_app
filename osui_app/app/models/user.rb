class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, #:registerable,:recoverable,登録リカバーは無
          :rememberable, :validatable
  acts_as_google_authenticated drift: 10, issuer: 'TEST MY APP'
  after_create { |record| record.set_google_secret }
end
