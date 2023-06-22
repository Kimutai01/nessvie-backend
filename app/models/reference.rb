class Reference < ApplicationRecord
  belongs_to :profile
  validates :first_name, :last_name, :job_title, :organisation, :work_email, :phone_number, presence: true
end
