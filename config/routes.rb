Rails.application.routes.draw do
  root 'books#index'

  resources :users
  resources :sessions
  namespace :admin do
    resources :books do
      collection do
        post :book_update
      end
    end
  end
  
  resources :borrows
  resources :books do
    member do
      post :add_to_borrow
      post :return_book
    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
