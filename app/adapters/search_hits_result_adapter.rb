class SearchHitsResultAdapter
  attr_reader :hit

  def initialize(hit)
    @hit = hit
  end

  def method_missing(method, *args, &block)
    hit.instance.send(method, *args)
  end
end
