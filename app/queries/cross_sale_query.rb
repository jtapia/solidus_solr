class CrossSaleQuery < SearchBaseQuery
  def execute
    Sunspot.search(Spree::Product) do
      with(:taxon_ids, product.taxons.map(&:id))
      without(:name, product.name)
      order_by :popularity, :desc
      paginate page: 1, per_page: page_size || 10
    end
  end
end
