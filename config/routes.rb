Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'#localhosst3000する
  get 'home/about' => 'homes#about'
  resources :users
  get 'users/mypage' => 'users#mypage'
  resources :blogs do
  	resource :blog_comments, only: [:create, :destroy, :update, :edit]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end