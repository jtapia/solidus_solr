class CrossSaleQuery < SearchBaseQuery
  def execute
    SolrQuery.search(taxon_ids: product.taxons.map(&:id))
  end
end
