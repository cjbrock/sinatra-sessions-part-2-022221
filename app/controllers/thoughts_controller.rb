class ThoughtsController < ApplicationController


    get "/thoughts" do

        @thoughts = Thought.all
        erb :"thoughts/index" 
    end


    get "/thoughts/new" do
        erb :"thoughts/new" 
    end

    get "/thoughts/:id" do
        @thought = Thought.find_by_id(params[:id])
        erb :"thoughts/show"
    end
    


    post "/thoughts" do
        thought = Thought.new(params)
        if thought.save #TRUE :)
            redirect "thoughts/#{thought.id}"
        else
            redirect "thoughts/new"
        end

    end




    get "/thoughts/:id/edit" do
        # binding.pry
        @thought = Thought.find_by_id(params[:id])

        erb :"thoughts/edit"

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
