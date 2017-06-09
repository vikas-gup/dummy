class SecretCodeSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :user, :include => true
end
