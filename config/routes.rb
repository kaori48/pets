Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'#localhosst3000する
  get 'home/about' => 'homes#about'
  resources :users
  get 'users/mypage' => 'users#mypage'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end