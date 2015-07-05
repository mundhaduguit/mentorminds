class UserPreChallengesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_pre_challenge, only: [:show, :edit, :update, :destroy]

  # GET /user_pre_challenges
  # GET /user_pre_challenges.json
  def index
    @user_pre_challenges = UserPreChallenge.all
    @pre_challenges = PreChallenge.where(:industry_id => params[:company_id].to_i)
    @industry = Industry.find(params[:company_id])
  end

  # GET /user_pre_challenges/1
  # GET /user_pre_challenges/1.json
  def show

  end

  # GET /user_pre_challenges/new
  def new
    @user_pre_challenge = UserPreChallenge.new
  end

  # GET /user_pre_challenges/1/edit
  def edit
  end

  # POST /user_pre_challenges
  # POST /user_pre_challenges.json
  def create

    @user_pre_challenge = UserPreChallenge.new(user_pre_challenge_params)
    respond_to do |format|
      if @user_pre_challenge.save
        format.html { redirect_to user_pre_challenge_path(:id =>@user_pre_challenge.id, :pre_challenge_id => params[:pre_challenge_id]), notice: 'User pre challenge was successfully created.' }
        format.json { render :show, status: :created, location: @user_pre_challenge }
      else
        format.html { render :new }
        format.json { render json: @user_pre_challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_pre_challenges/1
  # PATCH/PUT /user_pre_challenges/1.json
  def update
    respond_to do |format|
      if @user_pre_challenge.update(user_pre_challenge_params)
        format.html { redirect_to @user_pre_challenge, notice: 'User pre challenge was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_pre_challenge }
      else
        format.html { render :edit }
        format.json { render json: @user_pre_challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_pre_challenges/1
  # DELETE /user_pre_challenges/1.json
  def destroy
    @user_pre_challenge.destroy
    respond_to do |format|
      format.html { redirect_to user_pre_challenges_url, notice: 'User pre challenge was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # create user challenges for the user
    def create_user_pre_challenges
       if params[:company_id].present?
               byebug
	       PreChallenge.where(params[:company_id].to_i).each{|pre_challenge|
		  unless current_user.user_pre_challenges.collect(&:pre_challenge_id).include? pre_challenge.id
		       current_user_new_challenge = current_user.user_pre_challenges.new
		       current_user_new_challenge.challenge = challenge
		       current_user_new_challenge.save
		  end
	       }
      end
    end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_pre_challenge
      @user_pre_challenge = UserPreChallenge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_pre_challenge_params
      params.require(:user_pre_challenge).permit(:user_id, :pre_challenge_id)
    end
end
