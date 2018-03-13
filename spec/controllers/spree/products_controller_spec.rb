require 'spec_helper'

describe Spree::ProductsController, search: true do
  let!(:taxon) { create(:taxon, name: 'example') }
  let!(:product1) { create(:product, name: 'Test1', taxons: [taxon]) }
  let!(:product2) { create(:product, name: 'Test2', taxons: [taxon]) }
  let!(:product3) { create(:product, name: 'Product') }
  let!(:line_item1) { create(:line_item, product: product1) }
  let!(:line_item2) { create(:line_item, product: product2) }
  let!(:order) { create(:order, line_items: [line_item1, line_item2]) }

  before do
    Spree::Product.reindex
    Sunspot.commit
  end

  describe '#up_sale_products' do
    context 'apply solr up sale' do
      it 'returns 0 products' do
        allow_any_instance_of(Sunspot::Search::StandardSearch).to receive(:hits).and_return([])

        get :show, params: { id: product1.slug }

        expect(assigns(:up_sale_products).hits).to be_empty
      end

      it 'returns products' do
        allow_any_instance_of(Sunspot::Search::StandardSearch).to receive(:hits).and_return([product2])
        get :show, params: { id: product1.slug }

        expect(assigns(:up_sale_products).hits).to_not be_empty
      end
    end
  end

  describe '#cross_sale_products' do
    context 'apply solr cross sale' do
      it 'returns 0 products' do
        allow_any_instance_of(Sunspot::Search::StandardSearch).to receive(:hits).and_return([])

        get :show, params: { id: product1.slug }

        expect(assigns(:cross_sale_products).hits).to be_empty
      end

      it 'returns products' do
        allow_any_instance_of(Sunspot::Search::StandardSearch).to receive(:hits).and_return([product2])
        get :show, params: { id: product1.slug }

        expect(assigns(:cross_sale_products).hits).to_not be_empty
      end
    end
  end

  describe '#similar_products' do
    context 'apply solr similar products' do
      xit 'returns 0 products' do
        allow_any_instance_of(Sunspot::Search::MoreLikeThisSearch).to receive(:hits).and_return([])

        get :show, params: { id: product1.slug }

        expect(assigns(:similar_products).hits).to be_empty
      end

      xit 'returns products' do
        allow_any_instance_of(Sunspot::Search::MoreLikeThisSearch).to receive(:hits).and_return([product2])
        get :show, params: { id: product1.slug }

        expect(assigns(:similar_products).hits).to_not be_empty
      end
    end
  end
end

