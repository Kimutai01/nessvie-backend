class Profile < ApplicationRecord
  belongs_to :user
  has_many :references, dependent: :destroy
end
