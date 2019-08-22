module LeaguesHelper

    def order_name
        @user.leagues = League.all.order('name DESC')
    end 
end
