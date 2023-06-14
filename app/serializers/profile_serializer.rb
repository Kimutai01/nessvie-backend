class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :name, :documents, :job
  has_one :user
end
