class TopicsController < ApplicationController
    def index
        @topics = Topic.all
    end
    def new
        @topic = Topic.new
    end
    def create
        @topic = Topic.new(topic_params)
        if @topic.save
          flash[:success] = "Object successfully created"
          redirect_to @topic
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end
    def show
        @topic = Topic.find(params[:id])
    end
    def edit
        @topic = Topic.find(params[:id])
    end
    def update
        @topic = Topic.find(params[:id])
        if @topic.update(topic_params)
          flash[:success] = "Object was successfully updated"
          redirect_to @topic
        else
          flash[:error] = "Something went wrong"
          render 'edit'
        end
    end
    
    
    private
    def topic_params
        params.require(:topic).permit(:title, :notes, :video, :course_id)
    end
end
