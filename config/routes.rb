Rails.application.routes.draw do
  root 'welcome#index'

  resources :users
  resources :sessions
  resources :books
  namespace :admin do
    resources :books do
      collection do
        post :book_update
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
