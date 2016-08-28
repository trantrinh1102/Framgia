class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @user = current_user
    end
  end
end
