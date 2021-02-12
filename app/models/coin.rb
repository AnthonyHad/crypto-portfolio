class Coin < ApplicationRecord
  belongs_to :investment, optional: true
end
