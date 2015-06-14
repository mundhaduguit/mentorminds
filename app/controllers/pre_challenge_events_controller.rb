class PreChallengeEventsController < ApplicationController
  before_action :set_pre_challenge_event, only: [:show, :edit, :update, :destroy]

  # GET /pre_challenge_events
  # GET /pre_challenge_events.json
  def index
    @pre_challenge_events = PreChallengeEvent.all
  end

  # GET /pre_challenge_events/1
  # GET /pre_challenge_events/1.json
  def show
  end

  # GET /pre_challenge_events/new
  def new
    @pre_challenge_event = PreChallengeEvent.new
  end

  # GET /pre_challenge_events/1/edit
  def edit
  end

  # POST /pre_challenge_events
  # POST /pre_challenge_events.json
  def create
    @pre_challenge_event = PreChallengeEvent.new(pre_challenge_event_params)

    respond_to do |format|
      if @pre_challenge_event.save
        format.html { redirect_to @pre_challenge_event, notice: 'Pre challenge event was successfully created.' }
        format.json { render :show, status: :created, location: @pre_challenge_event }
      else
        format.html { render :new }
        format.json { render json: @pre_challenge_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pre_challenge_events/1
  # PATCH/PUT /pre_challenge_events/1.json
  def update
    respond_to do |format|
      if @pre_challenge_event.update(pre_challenge_event_params)
        format.html { redirect_to @pre_challenge_event, notice: 'Pre challenge event was successfully updated.' }
        format.json { render :show, status: :ok, location: @pre_challenge_event }
      else
        format.html { render :edit }
        format.json { render json: @pre_challenge_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pre_challenge_events/1
  # DELETE /pre_challenge_events/1.json
  def destroy
    @pre_challenge_event.destroy
    respond_to do |format|
      format.html { redirect_to pre_challenge_events_url, notice: 'Pre challenge event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pre_challenge_event
      @pre_challenge_event = PreChallengeEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pre_challenge_event_params
      params.require(:pre_challenge_event).permit(:state)
    end
end
