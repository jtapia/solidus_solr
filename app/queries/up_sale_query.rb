class UpSaleQuery < SearchBaseQuery
  def execute
    SolrQuery.search(product_ids_bought_together: product.id)
  end
end
