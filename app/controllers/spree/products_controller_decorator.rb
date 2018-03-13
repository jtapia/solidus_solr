Spree::ProductsController.class_eval do
  before_action :up_sale_products, only: [:show]
  before_action :cross_sale_products, only: [:show]
  before_action :more_like_this, only: [:show]

  private

  def cross_sale_products
    @cross_sale_products ||= SolrQuery.search(product_ids_bought_together: @product.id)
  end

  def up_sale_products
    @up_sale_products ||= SolrQuery.search(taxon_ids: @product.taxons.map(&:id))
  end

  def more_like_this
    @more_like_this ||= SolrQuery.more_like_this(@product)
  end
end
