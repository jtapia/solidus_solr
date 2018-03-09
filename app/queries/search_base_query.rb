class SearchBaseQuery
  attr_reader :product, :page_size

  def initialize(product, page_size = 1)
    @product = product
  end
end
