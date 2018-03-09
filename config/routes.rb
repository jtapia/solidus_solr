Spree::Core::Engine.routes.draw do
  get 'search', to: 'search#index', as: :search
end
