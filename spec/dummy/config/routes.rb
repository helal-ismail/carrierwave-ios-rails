Rails.application.routes.draw do
  mount CarrierwaveIosRails::Engine => "/ios-api"
end
