class Coffee < ApplicationRecord

    belongs_to :barister

    validates :size, length: {minimum: 2}

    def summary
        "decscription: #{name} - #{size} price:#{price}"
    end
end

