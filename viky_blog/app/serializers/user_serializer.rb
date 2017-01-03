class UserSerializer < ActiveModel::Serializer
	attributes :id, :email, :firstname, :lastname, :contact_number, :username, :age
	has_many :posts, :embed => :ids, :include => true
	def posts
		object.posts.order(created_at: :desc)
	end
end
