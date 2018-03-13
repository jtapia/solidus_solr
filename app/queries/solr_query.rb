class SolrQuery
  def self.search(options)
    Sunspot.search(Spree::Product) do
      fulltext options[:q] if options[:q]
      with(:taxon_ids, options[:taxon_ids]) if options[:taxon_ids]
      with(:product_ids_bought_together, options[:product_ids_bought_together]) if options[:product_ids_bought_together]
      order_by :popularity, :desc
      paginate page: options.fetch(:page, 1), per_page: options.fetch(:per_page, Spree::Config[:products_per_page])

      options.fetch(:facets, []).each do |facet_name|
        facet facet_name
      end
    end
  end

  def self.more_like_this(product, per_page: 6)
    Sunspot.more_like_this(product, Spree::Product) do
      fields :description
      order_by :popularity, :desc
      paginate page: 1, per_page: per_page
    end
  end
end
