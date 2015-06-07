class UserChallengesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_challenge, only: [:show, :edit, :update, :destroy]

  # GET /user_challenges
  # GET /user_challenges.json
  def index
    @user_challenges = Challenge.where(:pre_challenge_id => params[:pre_challenge_id])
    @user_answer = UserAnswer.new
    
  end

  # GET /user_challenges/1
  # GET /user_challenges/1.json
  def show
  end

  # GET /user_challenges/new
  def new
    @user_challenge = UserChallenge.new
  end

  # GET /user_challenges/1/edit
  def edit
  end

  # POST /user_challenges
  # POST /user_challenges.json
  def create
    @user_challenge = UserChallenge.new(user_challenge_params)

    respond_to do |format|
      if @user_challenge.save
        format.html { redirect_to @user_challenge, notice: 'User challenge was successfully created.' }
        format.json { render :show, status: :created, location: @user_challenge }
      else
        format.html { render :new }
        format.json { render json: @user_challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_challenges/1
  # PATCH/PUT /user_challenges/1.json
  def update
    respond_to do |format|
      if @user_challenge.update(user_challenge_params)
        format.html { redirect_to @user_challenge, notice: 'User challenge was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_challenge }
      else
        format.html { render :edit }
        format.json { render json: @user_challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_challenges/1
  # DELETE /user_challenges/1.json
  def destroy
    @user_challenge.destroy
    respond_to do |format|
      format.html { redirect_to user_challenges_url, notice: 'User challenge was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  
  def progress
  end
  
  def leader_board
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_challenge
      @user_challenge = UserChallenge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_challenge_params
      params.require(:user_challenge).permit(:user_id, :challenge_id, :locked, :marks)
    end
end
