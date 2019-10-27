class User < ApplicationRecord
  belongs_to :organization

  def self_intro
    "私の名前は#{name}です"
  end

  def self.filter_users_with_email
    self.where.not(email: [nil, ""])
  end
end
