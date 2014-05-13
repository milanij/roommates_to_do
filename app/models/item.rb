class Item
  include Mongoid::Document
  field :name, type: String
  field :quantity, type: Float
  field :description, type: String
  
end
