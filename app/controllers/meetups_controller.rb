class MeetupsController < ApplicationController
  before_action :set_meetup, only: [:show, :edit, :update, :destroy]
  before_action :disallow_disabled

  helper_method :is_instructor?
  helper_method :is_registered_as_diver_or_instructor?

  # GET /meetups or /meetups.json
  def index
    @meetups = Meetup.all

    filter_params.each do |key, value|
      @meetups = @meetups.public_send(key, value) if value.present?
    end

    if (user_signed_in?)
      @registered_diver = Diver.where(user_id: current_user.id).first
      @registered_instructor = Instructor.where(user_id: current_user.id).first
    else
      @registered_diver = nil
      @registered_instructor = nil
    end
  end

  # GET /meetups/1 or /meetups/1.json
  def show
    @meetup = Meetup.find(params[:id])
    @comment = Comment.new
  end

  # GET /meetups/new
  def new
    @meetup = Meetup.new


    if !(is_valid_user_type?)
      respond_to do |format|
        format.html { redirect_to meetups_path, notice: 'You cannot create a meetup of that user type' }
      end    
    end
  end

  # GET /meetups/1/edit
  def edit
    @meetup = Meetup.find(params[:id])
  end

  # POST /meetups or /meetups.json
  def create

    @meetup = Meetup.new(meetup_params)

    has_errored = false
    if params[:type] == "diver"
      @meetup.meetup_type = "diver"
    elsif params[:type] == "instructor"
      @meetup.meetup_type = "instructor"
    else
      respond_to do |format|
        has_errored = true
        format.html { redirect_to new_meetup_with_type_path(params[:type]), alert: 'Meetup type must be of type diver or instructor' }
      end
    end

    if !(has_errored)
      if (params[:meetup][:name] == nil || params[:meetup][:name] == '') || (params[:meetup][:description] == nil || params[:meetup][:description] == '')
        respond_to do |format|
          has_errored = true
          format.html { redirect_to new_meetup_with_type_path(params[:type]), alert: 'Please enter both a name and description for your meetup' }
        end
      end
    end

    if !(has_errored)
      if !(params[:meetup][:member_limit].to_i > 0)
        respond_to do |format|
          has_errored = true
          format.html { redirect_to new_meetup_with_type_path(params[:type]), alert: 'Please enter a member limit to this meetup, greater than 0' }
        end
      end
    end

    if !(has_errored)
      if is_diver?
        @meetup.price = 0
      elsif params[:meetup][:price] == nil || params[:meetup][:price] == ''
        respond_to do |format|
          has_errored = true
          format.html { redirect_to new_meetup_with_type_path(params[:type]), alert: 'Please specify how much you want to charge for the course' }
        end
      end
    end

    if !(has_errored)
      respond_to do |format|
        if @meetup.save

          Meetupmember.create({meetup_id: @meetup.id, user_id: current_user.id, is_owner: true, can_edit: true})

          format.html { redirect_to meetup_path(@meetup.id), notice: 'Meetup was successfully created.' }
          format.json { render :show, status: :created, location: @meetup }
        else
          format.html { render :new }
          format.json { render json: @meetup.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /meetups/1 or /meetups/1.json
  def update

    @meetup.meetupmembers.each do |member|
      if (member.user_id == current_user.id) && (member.can_edit == true)
        respond_to do |format|
          if @meetup.update(meetup_params)
            format.html { redirect_to @meetup, notice: 'Meetup was successfully updated.' }
            format.json { render :show, status: :ok, location: @meetup }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @meetup.errors, status: :unprocessable_entity }
          end
        end
      else
        respond_to do |format|
          format.html { redirect_to @meetup, notice: 'You do not have permission to edit this meetup' }
        end
      end
    end


  end

  def join_meetup

    if !(is_registered_as_diver_or_instructor?)
      respond_to do |format|
        format.html { redirect_to meetups_path, notice: 'You must register yourself as a diver or instructor before joining' }
      end
    else
      if Meetupmember.where("meetup_id = ? and user_id = ?", params[:id], current_user.id).first != nil
        respond_to do |format|
          format.html { redirect_to meetups_url, notice: 'You are already already a member of this meetup' }
          format.json { head :no_content }
        end
      else

        #check for payment here

        Meetupmember.create({meetup_id: params[:id], user_id: current_user.id, is_owner: false, can_edit: false})
        respond_to do |format|
          format.html { redirect_to meetup_path(params[:id]), notice: 'Success! You are now attending this meetup!' }
          format.json { head :no_content }
        end
      end
    end


    

  end

  # DELETE /meetups/1 or /meetups/1.json
  def destroy

    if user_signed_in?
      
      @meetupmember = Meetupmember.where("meetup_id = ? and user_id = ? and can_edit = ?", params[:id], current_user.id, true).first
      if @meetupmember != nil

        @members_of_meetup = Meetupmember.where(meetup_id: params[:id])
        @members_of_meetup.each do |meetup|
          meetup.destroy
        end

        @meetup.destroy
        respond_to do |format|
          format.html { redirect_to meetups_url, notice: 'Meetup was successfully destroyed.' }
          format.json { head :no_content }
        end
      else
        respond_to do |format|
          format.html { redirect_to meetups_url, notice: 'You are not authorised to delete this meetup' }
          format.json { head :no_content }
        end
      end
    end

  end

  def is_diver?
    if params[:type] == "diver"
      return true
    end
    return false
  end

  def is_instructor?
    if params[:type] == "instructor"
      return true
    end
    return false
  end

  def is_registered_as_diver_or_instructor?
    diver = Diver.where("user_id = ?", current_user.id).first
    instructor = Instructor.where("user_id = ?", current_user.id).first

    if diver == nil && instructor == nil
      return false
    end 
    return true
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meetup
      @meetup = Meetup.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def meetup_params
      params.require(:meetup).permit(:name, :description, :is_commercial_trip, :street_address, :city, :state, :country, :is_boat_required, :price, :member_limit, :date, :latitude, :longitude)
    end

    def is_valid_user_type?
      if params[:type] != "diver" && params[:type] != "instructor"
        return false
      end
      return true
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

    def filter_params
      # slice will elimate anything from the params hash that doesn't include the following
      params.slice(:meetup_type)
    end
    
end
