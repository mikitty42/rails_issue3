class ApplicationController < ActionController::Base
  include SessionsHelper
  
  def ensure_current_user
    if current_user.id != params[:id].to_i
      flash[:notice]="権限がありません"
    end
  end



end
