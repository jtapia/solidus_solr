require 'spec_helper'

describe SearchHitsAdapter do
  let!(:taxon) { create(:taxon, name: 'example') }
  let!(:product) { create(:product, name: 'Test', taxons: [taxon]) }

  subject { SearchHitsAdapter.new(Sunspot.search(Spree::Product) { keywords 'test' }.hits) }

  context '#total_pages' do
    it 'returns total pages' do
      expect(subject.total_pages).to eq(1)
    end
  end
end