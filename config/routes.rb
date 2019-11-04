Rails.application.routes.draw do
  devise_for :users

  mount API::Core, at: '/'
  mount GrapeSwaggerRails::Engine => '/docs'
end
