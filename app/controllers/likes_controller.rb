class LikesController < ApplicationController
    before_action :find_post
    before_action :find_like, only: [:destroy]


    #will like a post 
    def create
        if already_liked?
          flash[:notice] = "You can't like more than once"
        else
          @post.likes.create(user_id: current_user.id)
        end
        # redirects to current page
        redirect_to request.referrer
    end

    #used to unlike a post 
    def destroy
        if !(already_liked?)
          flash[:notice] = "Cannot unlike"
        else
          @like.destroy
        end


        ### saving this code incase i need it later
            ####redirect_to post_path(@post)
        # redirects to current page
        redirect_to request.referrer
      end

    private
    
    def find_post
        @post = Post.find(params[:post_id])
    end

    def already_liked?
        Like.where(user_id: current_user.id, post_id:
        params[:post_id]).exists?
    end

    def find_like
        @like = @post.likes.find(params[:id])
    end

end
