class UsersController < ApplicationController

  before_action :disallow_disabled

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

    if params[:diver][:total_dives] == nil || params[:diver][:total_dives] == ''
      respond_to do |format|
        format.html { redirect_to divers_reg_path, alert: 'Please enter how many dives you have done' }
      end
    elsif !(params[:diver][:total_dives].to_i > 0)
      respond_to do |format|
        format.html { redirect_to divers_reg_path, alert: 'Please enter how many dives you have done, greater than 0' }
      end
    else
      if Diver.where(user_id: current_user.id).first != nil
      
        respond_to do |format|
          format.html { redirect_to home_index_path, alert: 'You have already registered as a diver' }
        end
  
      else
  
        respond_to do |format|
          if @diver.save!
            format.html { redirect_to home_index_path, notice: 'Diver was successfully registered' }
          else
            format.html { render :new_diver }
          end
        end
  
      end
    end




  end

  def new_instructor
    @instructor = Instructor.new
    @certagencies = Certagency.all
    @courses = Course.all
  end

  def register_instructor
    @instructor = Instructor.new(instructor_params)

    if Instructor.where(user_id: current_user.id).first != nil
      
      respond_to do |format|
        format.html { redirect_to home_index_path, alert: 'You have already registered as an instructor' }
      end

    elsif params[:instructor][:total_dives] == nil || params[:instructor][:total_dives] == ''
      respond_to do |format|
        format.html { redirect_to instructors_reg_path, alert: 'Please enter how many dives you have done' }
      end
    elsif !(params[:instructor][:total_dives].to_i > 0)
      respond_to do |format|
        format.html { redirect_to instructors_reg_path, alert: 'Please enter how many dives you have done, greater than 0' }
      end
    else

      @instructor.user_id = current_user.id
      @instructor.certagency_id = params[:instructor][:certagency_id]
  
      respond_to do |format|
        if @instructor.save!
  
          if Abletoteach.where(instructor_id: current_user.id).first != nil
            respond_to do |format|
              @instructor.destroy
              format.html { redirect_to home_index_path, alert: 'You have already chosen the courses you are available to teach' }
            end
          else
              course_to_teach_added = false
              params[:instructor][:course][:course_name].each do |chosen_course_id|
                Abletoteach.create({instructor_id: @instructor.id, course_id: chosen_course_id})
                if chosen_course_id != '0'
                  course_to_teach_added = true
                end
              end
              if course_to_teach_added == false
                @instructor.destroy
                format.html { redirect_to instructors_reg_path, alert: 'You must specify at least one course or speciality that you can teach' }
              else
                format.html { redirect_to home_index_path, notice: 'Instructor was successfully registered' }
              end                 
             
          end
         else
          format.html { render :new_instructor }
        end
      end

    end
    

  end


  private

  def diver_params
    params.require(:diver).permit(:total_dives, :certagency_id, :qualification_id)
  end

  def instructor_params
    params.require(:instructor).permit(:total_dives, :certagency_id, course_attributes:[:id, :course_name])
  end

  def disallow_disabled
    if user_signed_in?
      if current_user.has_role? :disabled
        respond_to do |format|
          format.html { redirect_to home_index_path, alert: 'Your account has been disabled' }
        end
      end
    end
  end

end
