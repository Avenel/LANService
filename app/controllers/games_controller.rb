class GamesController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /games
  # GET /games.json
  def index
    calcVotes
    @games = Game.order("votes DESC").all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @games }
    end
  end

  # GET /games/1
  # GET /games/1.json
  def show
    @game = Game.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @game }
    end
  end

  # GET /games/new
  # GET /games/new.json
  def new
    @game = Game.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @game }
    end
  end

  # GET /games/1/edit
  def edit
    @game = Game.find(params[:id])
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(params[:game])

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render json: @game, status: :created, location: @game }
      else
        format.html { render action: "new" }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /games/1
  # PUT /games/1.json
  def update
    @game = Game.find(params[:id])

    respond_to do |format|
      if @game.update_attributes(params[:game])
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game = Game.find(params[:id])
    @game.destroy

    respond_to do |format|
      format.html { redirect_to games_url }
      format.json { head :no_content }
    end
  end

  def calcVotes
    games = Game.all

    games.each do |game|
      game.votes = 0
      game.save
    end

    users = User.all
    users.each do |user|

      if !(user.fav1.nil?) then
        favGame1 = Game.find(user.fav1)
        favGame1.votes += 1
        favGame1.save
      end

      if !(user.fav2.nil?) then
        favGame2 = Game.find(user.fav2)
        favGame2.votes += 1
        favGame2.save
      end

      if !(user.fav3.nil?) then
        favGame3 = Game.find(user.fav3)
        favGame3.votes += 1
        favGame3.save
      end

      if !(user.fav4.nil?) then
        favGame4 = Game.find(user.fav4)
        favGame4.votes += 1
        favGame4.save
      end

      if !(user.fav5.nil?) then
        favGame5 = Game.find(user.fav5)
        favGame5.votes += 1
        favGame5.save
      end
    end
  end

end
