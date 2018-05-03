class UsersController < ApplicationController
  def new_diver
    @diver = Diver.new

    @certagencies = Certagency.all
    @qualifications = Qualification.all
  end

  def register_diver
    @diver = Diver.new(diver_params)

    @diver.user_id = current_user.id
    @diver.certagency_id = params[:diver][:certagency_id]
    @diver.qualification_id = params[:diver][:qualification_id]

    respond_to do |format|
       if @diver.save!
         format.html { redirect_to home_index_path, notice: 'Diver was successfully registered' }
       else
         format.html { render :new_diver }
       end
     end
  end

  def new_skipper
  end

  def new_instructor
  end

  private

  def diver_params
    params.require(:diver).permit(:total_dives, :certagency_id, :qualification_id)
  end

end
