class UserSerializer < ActiveModel::Serializer
  attributes :username, :email, :id, :role
end
