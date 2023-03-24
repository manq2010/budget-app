Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
    sign_in: 'login', sign_out: 'logout',
    password: 'secret', confirmation: 'verification',
    registration: 'register', edit: 'edit/profile'
  }, sign_out_via: [:get, :post]

  resources :groups, path: 'categories', only: [:new, :create, :index, :show, :destroy, :edit] do
    resources :expenses, only: [:new, :create, :index, :show, :destroy]
  end
  root to: "splash#index"
end
