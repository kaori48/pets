Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'#localhosst3000する
  get 'home/about' => 'homes#about'
  get 'users/mypage' => 'users#mypage'
  resources :users
  resources :blogs do
  	resource :blog_comments, only: [:create, :destroy]
  	resource :favorites, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end