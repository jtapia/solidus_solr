module Spree
  module SearchHelper
    def show_cross_sale_products
      render partial: 'spree/shared/cross_sale_products'
    end

    def show_up_sale_products
      render partial: 'spree/shared/up_sale_products'
    end
  end
end
