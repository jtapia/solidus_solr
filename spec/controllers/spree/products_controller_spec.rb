require 'spec_helper'

describe Spree::ProductsController, search: true do
  let!(:taxon) { create(:taxon, name: 'example') }
  let!(:product) { create(:product, name: 'Test', taxons: [taxon]) }
  let!(:up_sale_query) { UpSaleQuery.new(product) }
  let!(:cross_sale_query) { UpSaleQuery.new(product) }

  describe '#up_sale_products' do
    context 'apply solr up sale' do
      it 'returns 0 products' do
        allow(UpSaleQuery).to receive(:new).and_return(up_sale_query)

        get :show, params: { id: product.slug }

        expect(response.status).to be(200)
      end
    end
  end

  describe '#cross_sale_products' do
    context 'apply solr cross sale' do
      it 'returns 0 products' do
        allow(CrossSaleQuery).to receive(:new).and_return(cross_sale_query)

        get :show, params: { id: product.slug }

        expect(response.status).to be(200)
      end
    end
  end
end

