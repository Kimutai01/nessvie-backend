class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :surname , :email, :phone, :address, :city, :country, :post_code, :profession, :dob, :job, :user_id , :manual_handling_certificate, :health_and_safety_certificate,  :approved
  belongs_to :user
end
