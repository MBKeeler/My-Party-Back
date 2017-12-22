class BeverageSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :recipe, :rating, :occasion, :instructions
end
