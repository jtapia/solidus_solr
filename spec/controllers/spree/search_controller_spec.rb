require 'spec_helper'

describe Spree::SearchController, search: true do
  let!(:taxon) { create(:taxon, name: 'example') }
  let!(:product) { create(:product, name: 'Test', taxons: [taxon]) }

  describe '#index' do
    context 'when solr server finds a keyword' do
      let(:params) { { q: 'test' } }

      it 'returns 0 products' do
        get :index, params: { q: 'xyz' }

        expect(response.status).to be(200)
        expect(Sunspot.search(Spree::Product) { keywords "xyz"}.hits.count).to eq(0)
      end

      it 'returns 1 product' do
        get :index, params: params

        expect(response.status).to be(200)
        expect(Sunspot.search(Spree::Product) { keywords "test"}.hits.count).to eq(1)
      end

      it 'returns products with taxon_ids' do
        get :index, params: params.merge({ taxon_ids: [taxon.id] })

        expect(response.status).to be(200)
        expect(Sunspot.search(Spree::Product) { keywords ""}.hits.count).to eq(1)
      end
    end
  end
end

