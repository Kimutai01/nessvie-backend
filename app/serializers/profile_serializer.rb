class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :email, :phone, :address, :city, :country, :zip_code, :profession, :dob, :job, :user_id , :manual_handling_certificate, :health_and_safety_certificate,  :approved
  belongs_to :user
end
