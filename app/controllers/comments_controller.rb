class CommentsController < ApplicationController
  before_action :disallow_disabled

  def add_comment
    if user_signed_in?
      if Meetupmember.where("meetup_id = ? and user_id = ?", params[:id], current_user.id).first != nil
        @comment = Comment.create({ user_id: current_user.id, content: params[:comment][:content] })
        Meetupcomment.create({ meetup_id: params[:id], comment_id: @comment.id })
        redirect_to meetup_path(params[:id])
      else
        render plain: params[:id]
        # redirect_to home_index_path
      end
    else
      redirect_to new_user_session_path
    end
  end

  private

  def disallow_disabled
    if user_signed_in?
      if current_user.has_role? :disabled
        respond_to do |format|
          format.html { redirect_to home_index_path, alert: "Your account has been disabled" }
        end
      end
    end
  end
end
