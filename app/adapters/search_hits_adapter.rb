class SearchHitsAdapter
  attr_reader :hits, :results

  def initialize(hits)
    @hits = hits
    @results = hits.inject([]) { |f, i| f << SearchHitsResultAdapter.new(i); f }
  end

  delegate :each, to: :results
  delegate :empty?, to: :results

  def method_missing(method, *args, &block)
    @hits.send(method, *args) if @hits.respond_to?(method)
  end

  def total_pages
    @hits.total_pages
  end
end
