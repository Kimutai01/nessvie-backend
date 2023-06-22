class ReferenceSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :job_title, :organisation, :work_email, :phone_number
  has_one :profile
end
