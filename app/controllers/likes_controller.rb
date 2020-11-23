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
        redirect_to request.referrer
      end

    private
    #get post id
    def find_post
        @post = Post.find(params[:post_id])
    end
    # used to see if current user has already liked post 
    # so you can only like a post once
    def already_liked?
        Like.where(user_id: current_user.id, post_id:
        params[:post_id]).exists?
    end
    # finds a like 
    # used to delete a like
    def find_like
        @like = @post.likes.find(params[:id])
    end

end
