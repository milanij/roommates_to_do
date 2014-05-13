class List
  include Mongoid::Document
  field :name, type: String
  embedded_in :item
end
