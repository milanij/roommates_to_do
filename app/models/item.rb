class Item
  include Mongoid::Document
  field :name, type: String
  field :quantity, type: String
  field :description, type: String
  
end
