class BeverageSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :recipe, :rating, :occasion, :user_id
end
