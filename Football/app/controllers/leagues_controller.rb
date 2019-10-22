class LeaguesController < ApplicationController
    before_action :require_login

    def index
        @leagues = League.all
        # render json: @leagues
        # end 

        @user = User.find_by(id: params[:user_id])
        if @user = current_user
            @user.leagues 
        else 
            redirect_to root_path
        end 
    end 

    def new 
        @league = League.new
        @league.save
    end 

    def create
        # binding.pry
        @league = League.create(league_params)
        @league.user = current_user
    
        respond_to do |format|
          if @league.save
            format.html { redirect_to user_league_path(current_user, @league)}
          else
            format.html { render :new }
          end
        end
      end

    def show
        # @leagues = League.all
        # render json: @leagues 
        @league = League.find(params[:id])
        @user = current_user
    end 

    
        # @user = current_user
        # @league = League.create(league_params)
        #     if @league.save
        #         redirect_to league_path(@league)
        #     else 
        #         flash[:message] = "Missing info in a field"
        #         redirect_to user_leagues_path(@user)
        #     end  
    # end 


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

    def cost
        league = League.find_by_id(params[:id])
        render plain: league.cost
    end 

    def people_in_league 
        league = League.find_by_id(params[:id])
        render plain: league.people_in_league
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
