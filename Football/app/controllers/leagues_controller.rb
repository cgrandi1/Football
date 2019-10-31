class LeaguesController < ApplicationController
    before_action :require_login

    def index
      @user = current_user
      @leagues = @user.leagues
      respond_to do |form|
        form.html{render :index}
        form.json{render json: @leagues}
      end 
      if @user = session[:id]
        logged_in?
      end 
    end 

    def new 
      @league = League.new
      @league.save
    end 

  def create
    @league = League.create(league_params)
    @league.user = current_user
    if @league.save
      render json: @league, status: 201
    else
      render :new
    end
  end

    # def cost
    #   league = League.find_by_id(params[:id])
    #   render plain: league.cost
    # end 

    # def people_in_league 
    #   league = League.find_by_id(params[:id])
    #   render plain: league.people_in_league
    # end 

    def show
      @user = User.find(session[:user_id])
      @league = League.find(params[:id])
      respond_to do |form|
        form.html{render :show}
        form.json{render json: @league}
      end 
    end 
      
    def edit 
        @league = League.find(params[:id])
    end 

    def update 
        @league = League.find(params[:id])
        @league.update(league_params)
        @league.save
        redirect_to user_league_path(@league)
    end 



    def destroy
        @user = current_user
        @league = League.find(params[:id])
        @league.destroy
        redirect_to user_leagues_path(@user)
      end


      def max_league
        @league = League.most_leagues
        user = @league.max_by{|k,v| v}
        @user = User.find_by_id(user[0])
      end 

    private

    # def set_league
    #     @league = League.find(params[:id])
    #   end

    def league_params
        params.require(:league).permit(:name, :cost, :people_in_league, :user_id)
    end 
end
