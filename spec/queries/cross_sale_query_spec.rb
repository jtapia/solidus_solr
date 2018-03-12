require 'spec_helper'

describe CrossSaleQuery, search: true do
  let!(:taxon) { create(:taxon, name: 'example') }
  let!(:product1) { create(:product, name: 'Test1', taxons: [taxon]) }
  let!(:product2) { create(:product, name: 'Test2', taxons: [taxon]) }
  let!(:line_item1) { create(:line_item, product: product1) }
  let!(:line_item2) { create(:line_item, product: product2) }
  let!(:order) { create(:order, line_items: [line_item1, line_item2]) }

  subject { CrossSaleQuery.new(product1) }

  context '#execute' do
    it 'returns products' do
      expect(subject.execute).to be_kind_of(Sunspot::Search::StandardSearch)
    end
  end
end