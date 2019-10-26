class User < ApplicationRecord
  validates :nickname, presence: true, length: { maximum: 6 }
end
