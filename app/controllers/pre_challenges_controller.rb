class PreChallengesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pre_challenge, only: [:show, :edit, :update, :destroy]

  # GET /pre_challenges
  # GET /pre_challenges.json
  def index
    @pre_challenges = PreChallenge.all
  end

  # GET /pre_challenges/1
  # GET /pre_challenges/1.json
  def show
  end

  # GET /pre_challenges/new
  def new
    @pre_challenge = PreChallenge.new
  end

  # GET /pre_challenges/1/edit
  def edit
  end

  # POST /pre_challenges
  # POST /pre_challenges.json
  def create
    @pre_challenge = PreChallenge.new(pre_challenge_params)

    respond_to do |format|
      if @pre_challenge.save
        #format.html { redirect_to @pre_challenge, notice: 'Pre challenge was successfully created.' }
        format.html { redirect_to categories_list_industry_categories_url, notice: 'Pre challenge was successfully created.' }
        format.json { render :show, status: :created, location: @pre_challenge }
      else
        format.html { render :new }
        format.json { render json: @pre_challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pre_challenges/1
  # PATCH/PUT /pre_challenges/1.json
  def update
    respond_to do |format|
      if @pre_challenge.update(pre_challenge_params)
        format.html { redirect_to @pre_challenge, notice: 'Pre challenge was successfully updated.' }
        format.json { render :show, status: :ok, location: @pre_challenge }
      else
        format.html { render :edit }
        format.json { render json: @pre_challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pre_challenges/1
  # DELETE /pre_challenges/1.json
  def destroy
    @pre_challenge.destroy
    respond_to do |format|
      format.html { redirect_to pre_challenges_url, notice: 'Pre challenge was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pre_challenge
      @pre_challenge = PreChallenge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pre_challenge_params
      params.require(:pre_challenge).permit(:name, :industry_id,:first_date, :second_date )
    end
end
