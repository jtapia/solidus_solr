module Spree
  class Product < MockRecord
    attr_accessor :id, :name, :description
  end
end

Sunspot.setup(Spree::Product) do
  string :name
  text :description
  integer :popularity
  integer :product_ids_bought_together
end