class GameStatsController < ApplicationController
  before_action :set_game_stat, only: [:show, :edit, :update, :destroy]

  # GET /game_stats
  # GET /game_stats.json
  def index
    @game_stats = GameStat.all
  end

  # GET /game_stats/1
  # GET /game_stats/1.json
  def show
  end

  # GET /game_stats/new
  def new
    @game_stat = GameStat.new
  end

  # GET /game_stats/1/edit
  def edit
  end

  # POST /game_stats
  # POST /game_stats.json
  def create
    @game_stat = GameStat.new(game_stat_params)

    respond_to do |format|
      if @game_stat.save
        format.html { redirect_to @game_stat, notice: 'Game stat was successfully created.' }
        format.json { render :show, status: :created, location: @game_stat }
      else
        format.html { render :new }
        format.json { render json: @game_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /game_stats/1
  # PATCH/PUT /game_stats/1.json
  def update
    respond_to do |format|
      if @game_stat.update(game_stat_params)
        format.html { redirect_to @game_stat, notice: 'Game stat was successfully updated.' }
        format.json { render :show, status: :ok, location: @game_stat }
      else
        format.html { render :edit }
        format.json { render json: @game_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_stats/1
  # DELETE /game_stats/1.json
  def destroy
    @game_stat.destroy
    respond_to do |format|
      format.html { redirect_to game_stats_url, notice: 'Game stat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_stat
      @game_stat = GameStat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_stat_params
      params.require(:game_stat).permit(:game_id, :player_id, :pts, :reb, :ast, :stls)
    end
end
