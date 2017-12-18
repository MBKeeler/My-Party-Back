class BeverageSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :recipe, :rating, :occassion
end
