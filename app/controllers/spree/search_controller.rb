module Spree
  class SearchController < StoreController
    def index
      results = SolrQuery.search(params.merge(facets: :taxon_ids))

      facets =  SolrQuery.search(q: params[:q], facets: :taxon_ids, per_page: 1).facets
      taxon_ids = facets.map(&:rows).first.map(&:value)
      taxons = Spree::Taxon.find(taxon_ids)

      @hits = SearchHitsAdapter.new(results.hits)
      @taxonomies = taxons.map(&:taxonomy).uniq
    end
  end
end
