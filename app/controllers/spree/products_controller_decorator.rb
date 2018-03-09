Spree::ProductsController.class_eval do
  before_action :up_sale_products, only: [:show]
  before_action :cross_sale_products, only: [:show]

  private

  def cross_sale_products
    @cross_sale_products ||= CrossSaleQuery.new(@product).execute
  end

  def up_sale_products
    @up_sale_products ||= UpSaleQuery.new(@product).execute
  end
end