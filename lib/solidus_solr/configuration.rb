module SolidusSolr
  class Configuration < Spree::Preferences::Configuration
    preference :taxonomies, :string, default: ''
  end
end
