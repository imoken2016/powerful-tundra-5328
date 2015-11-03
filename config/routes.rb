Rails.application.routes.draw do
  root to: "top#index" 
  resources :blogs
  get 'contacts' => 'contacts#index'              # 入力画面
  post 'contacts/confirm' => 'contacts#confirm'   # 確認画面
  post 'contacts/thanks' => 'contacts#thanks'     # 送信完了画面
end
