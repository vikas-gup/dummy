class PostSerializer < ActiveModel::Serializer
	attributes :id, :title, :description, :completed, :created_at
end
