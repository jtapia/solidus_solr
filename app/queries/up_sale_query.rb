class UpSaleQuery < SearchBaseQuery
  def execute
    Sunspot.search(Spree::Product) do
      with(:product_ids_bought_together, product.id)
      without(:name, product.name)
      order_by :popularity, :desc
      paginate page: 1, per_page: page_size || 10
    end
  end
end
