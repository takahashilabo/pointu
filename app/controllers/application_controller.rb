# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  # 現在のユーザーを取得するメソッド
  def current_user
    # セッションからユーザーIDを取得し、それに基づくユーザーを返す（例）
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
