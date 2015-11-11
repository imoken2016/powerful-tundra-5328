Rails.application.routes.draw do
  get 'users/index'

  get 'users/show'

  devise_for :user
  resources :user, only: [:index, :show]
  root to: "top#index" 
  resources :blogs
  get 'contacts' => 'contacts#index'              # 入力画面
  post 'contacts' => 'contacts#index'              # 入力画面
  post 'contacts/confirm' => 'contacts#confirm'   # 確認画面
  post 'contacts/thanks' => 'contacts#thanks'     # 送信完了画面
  
end
