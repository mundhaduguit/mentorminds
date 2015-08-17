class UserChallengesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_challenge, only: [:show, :edit, :update, :destroy]
  before_action :create_user_challenges, only: [:index]
  layout "user", only: [:progress, :leader_board]
  # GET /user_challenges
  # GET /user_challenges.json
  def index
    @user_pre_challenge = current_user.user_pre_challenges.where(:pre_challenge_id => params[:pre_challenge_id]).first
    unless  @user_pre_challenge.present?
      @user_pre_challenge = UserPreChallenge.new
    end
    @pre_challenge = PreChallenge.find((params[:pre_challenge_id]).to_i);
    @user_challenges = Challenge.where(:pre_challenge_id => params[:pre_challenge_id])

    challenge_ids = Challenge.where(:pre_challenge_id => params[:pre_challenge_id]).pluck(:id)
    challenge_ids.each do |challenge_id|
      UserChallenge.create(user_id: current_user.id, challenge_id: challenge_id) if UserChallenge.where(user_id: current_user.id, challenge_id: challenge_id).blank?
    end
    @user_challenges = UserChallenge.where("challenge_id in (?)", challenge_ids)
    flag=true
    a = false
    if params[:from_first].blank?
      @user_challenges.each{|ch|
        break if ch.user_answer.blank?
        if ch.user_answer.present? || ch.user_answer.status!="in progress" || ch.user_answer.status!="done"
          flag=false;
        end
      }
    end

    @user_challenges.each do |x|
      if x.locked == "done" && current_user.id == x.user_id
        a = true
      end
    end

    #redirect_to progress_user_challenges_path if a == true
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

    @user_current_industries = UserAnswer.joins(user_challenge: {challenge: {pre_challenge: :industry}}).where("user_answers.user_id = ? AND status IN (?) ", current_user.id, ['done', 'in progress']).select("industries.industry_category_id as industry_category_id").order("user_answers.updated_at DESC").uniq
    @user_accessed_industries = UserAccessedIndustry.get_user_accessed_industries(current_user.id)

  end
  
  def leader_board
    #@user = User.all
    @user_answers = UserAnswer.joins(:user).select("user_answers.user_id as user_id, sum(user_answers.marks) as marks").where(:status => 'done').group('user_id').order("marks DESC")
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_challenge
      @user_challenge = UserChallenge.find(params[:id])
    end
    
     # create user challenges for the user
    def create_user_challenges
       Challenge.where(params[:pre_challenge_id].to_i).each{ |challenge|
          unless current_user.user_challenges.collect(&:challenge_id).include? challenge.id
               current_user_new_challenge = current_user.user_challenges.new
               current_user_new_challenge.challenge = challenge
               current_user_new_challenge.save
          end
       }
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_challenge_params
      params.require(:user_challenge).permit(:user_id, :challenge_id, :locked, :marks)
    end
end
