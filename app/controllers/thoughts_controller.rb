class ThoughtsController < ApplicationController


    get "/thoughts" do
        if logged_in?
            @thoughts = Thought.all
            erb :"thoughts/index" 
        else
            redirect "/login"
        end
    end


    get "/thoughts/new" do
        if logged_in?
            erb :"thoughts/new" 
        else
            redirect "/login"
        end
    end

    get "/thoughts/:id" do
        if logged_in?
            @thought = Thought.find_by_id(params[:id])
            erb :"thoughts/show"
        else
            redirect "/login"
        end
    end
    


    post "/thoughts" do
        # make our thoughts belong to a user
        # thought = Thought.new(params)
        # thought.user_id = current_user.id
        thought = current_user.thoughts.build(params)
        if thought.save #TRUE :)
            redirect "thoughts/#{thought.id}"
        else
            redirect "thoughts/new"
        end

    end




    get "/thoughts/:id/edit" do
        # binding.pry
        if logged_in?
            @thought = Thought.find_by_id(params[:id])
            if @thought.user_id != current_user.id || @thought.user_id == nil
                redirect "/thoughts"  
            else
                erb :"thoughts/edit"
            end
        else
            redirect "/login"
        end
    end

    patch "/thoughts/:id" do
        # binding.pry

        @thought = Thought.find_by_id(params[:id])
        params.delete("_method")
        @thought.update(params)
     
        if @thought.update(params) #Did We Make a Change?
            redirect "/thoughts/#{@thought.id}"
        else
            redirect "thoughts/new"
        end

    end




    delete "/thoughts/:id" do
        @thought = Thought.find_by_id(params[:id])
        @thought.destroy
        redirect "/thoughts"
    end



end
