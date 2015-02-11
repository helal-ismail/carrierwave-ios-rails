CarrierwaveIosRails::Engine.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :attachments,
                only: [:index, :show, :create, :destroy, :download, :supported_extensions] do
        get :download, on: :member
        get :supported_extensions, on: :collection
      end
    end
  end
end
