require 'spec_helper'

describe UpSaleQuery, search: true do
  let!(:taxon) { create(:taxon, name: 'example') }
  let!(:product1) { create(:product, name: 'Test1', taxons: [taxon]) }
  let!(:product2) { create(:product, name: 'Test2', taxons: [taxon]) }

  subject { UpSaleQuery.new(product1) }

  context '#execute' do
    it 'returns products' do
      expect(subject.execute).to be_kind_of(Sunspot::Search::StandardSearch)
    end
  end
end