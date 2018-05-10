class CommentsController < ApplicationController
    before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
  	@comments = comment.all
    @comments = @comments.order(:updated_at).reverse_order 
  end

  def show

  end

  def new
  	@post = Post.find(params[:post_id])
    @comment = @post.comments.build
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id

     if @comment.save
        redirect_to post_path(@post), notice: "comment created successfully!"
      else
        flash[:error] = @comment.errors.full_messages.to_sentence
        render :new, notice: "comment could not be created!"
      end
  end

  def edit

  end

   def update
   	@post = Post.find(params[:post_id])
    if @comment.update_attributes(comment_params)
      redirect_to post_path(@post), notice: "comment updated successfully"
    else
      flash[:error] = "#{@comment.errors.count} errors prevented certificate from being updated."
      render :edit
    end

  end

  def destroy
  	@post = Post.find(params[:post_id])
  	@comment.destroy
  	 redirect_to post_path(@post), notice: "#{@comment.id} was deleted successfully!"
  end

  private
    def set_comment
      @comment = comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(
        :post_id, :body, :user_id
        )
    end
end
