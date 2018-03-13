require 'spec_helper'

describe SolrQuery, search: true do
  let!(:taxon) { create(:taxon, name: 'example') }
  let!(:product1) { create(:product, name: 'Test1', description: 'description test', taxons: [taxon]) }
  let!(:product2) { create(:product, name: 'Test2', description: 'description test', taxons: [taxon]) }
  let!(:line_item1) { create(:line_item, product: product1) }
  let!(:line_item2) { create(:line_item, product: product2) }
  let!(:order) { create(:order, line_items: [line_item1, line_item2]) }

  before do
    Spree::Product.reindex
    Sunspot.commit
  end

  context '#search' do
    it 'returns products' do
      expect(SolrQuery.search(q: product1.name)).to be_kind_of(Sunspot::Search::StandardSearch)
      expect(SolrQuery.search(q: product1.name).hits).to_not be_empty
    end
  end

  context '#more_like_this' do
    xit 'returns products' do
      expect(SolrQuery.more_like_this(product1)).to be_kind_of(Sunspot::Search::MoreLikeThisSearch)
      expect(SolrQuery.more_like_this(product1).hits).to_not be_empty
    end
  end
end