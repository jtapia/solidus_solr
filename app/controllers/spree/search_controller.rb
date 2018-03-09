module Spree
  class SearchController < StoreController
    def index
      results = Sunspot.search(Spree::Product) do
        fulltext params[:q]

        if params.key?(:taxon_ids)
          with(:taxon_ids, params[:taxon_ids])
        end

        paginate page: params.fetch(:page, 1), per_page: Spree::Config.products_per_page
        facet :taxon_ids
      end

      facets = Sunspot.search(Spree::Product) do
        fulltext params[:q]
        paginate page: 1, per_page: 1
        facet :taxon_ids
      end.facets

      taxon_ids = facets.map(&:rows).first.map(&:value)
      taxons = Spree::Taxon.find(taxon_ids)

      @hits = SearchHitsAdapter.new(results.hits)
      @taxonomies = taxons.map(&:taxonomy).uniq
    end
  end
end
