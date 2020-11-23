class CommentsController < ApplicationController

    before_action :find_post
    before_action :find_comment, only: [:destroy, :edit, :update, :comment_owner]
    before_action :comment_owner, only: [:destroy, :edit, :update]

    # create new comment 
    def create 
       # create a new comment 
        @comment = @post.comments.create(params[:comment].permit(:content))
        # set user id to current user
        @comment.user_id = current_user.id
        # save comment 
        @comment.save


        if @comment.save
            redirect_to post_path(@post)
        else
            render 'new'
        end
    
    end

    #delete comment 
    def destroy 
        @comment.destroy
        redirect_to post_path(@post)


    end
    
    def edit 

    end

    # update comment 
    def update
        if @comment.update(params[:comment].permit(:content))
            redirect_to post_path(@post)
        else
            render 'edit'
        end
    end

    private 
    # get post id 
    def find_post
        @post = Post.find(params[:post_id])

    end
    # get comment id
    def find_comment
        @comment = @post.comments.find(params[:id])
    
    end
    # see if current user == comment.user.id
    def comment_owner
        unless current_user.id == @comment.user.id
            flash[:notice] = "You don't have access to that!"
            redirect_to @post
        end
    
    end

end
