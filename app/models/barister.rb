class Barister < ApplicationRecord
    has_many :coffees
    validates :age, presence: true

    has_secure_password


end
