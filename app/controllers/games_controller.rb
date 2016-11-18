class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  # GET /games
  def index
    @games = Game.all
  end

  # GET /games/1
  def show
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  def create
    @game = Game.new(game_params)
    if @game.save
      format.html { redirect_to @game, notice: 'Game was successfully created.' }
    else
      format.html { render :new }
    end
  end

  # PATCH/PUT /games/1
  def update
    if @game.update(game_params)
      format.html { redirect_to @game, notice: 'Game was successfully updated.' }
    else
      format.html { render :edit }
    end
  end

  # DELETE /games/1
  def destroy
    @game.destroy
    format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params[:game]
    end
end