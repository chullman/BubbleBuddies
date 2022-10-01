class HomeController < ApplicationController
  def index
    if user_signed_in?
      @registered_diver = Diver.where(user_id: current_user.id).first
      @registered_instructor = Instructor.where(user_id: current_user.id).first
    end
  end
end
