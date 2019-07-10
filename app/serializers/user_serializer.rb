class UserSerializer < ActiveModel::Serializer
  
  attributes :id, :email
  has_many :tasks #let Serializer know about the has_to relationship so it knows to send it with the JSON 
end
