module LeaguesHelper

    def ordering
        League.order("created_at ASC")
    end 
    
end
