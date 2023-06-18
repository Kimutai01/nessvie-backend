class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :email, :phone, :address, :city, :country, :zip_code, :profession, :dob, :job, :user_id
  has_one :user
end
