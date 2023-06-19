class UserSerializer < ActiveModel::Serializer
  attributes :username, :email, :id, :role
  has_one :profile
end
