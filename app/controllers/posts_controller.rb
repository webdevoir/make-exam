class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
  	@posts = Post.all
    @posts = @posts.order(:updated_at).reverse_order 
  end

  def show

  end

  def new
  	@post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

     if @post.save
        redirect_to posts_path, notice: "Post created successfully!"
      else
        flash[:error] = @post.errors.full_messages.to_sentence
        render :new, notice: "post could not be created!"
      end
  end

  def edit

  end

   def update
    if @post.update_attributes(psot_params)
      redirect_to posts_path, notice: "Post updated successfully"
    else
      flash[:error] = "#{@post.errors.count} errors prevented certificate from being updated."
      render :edit
    end

  end

  def destroy

  	@postle.destroy
  	 redirect_to roles_path, notice: "#{@post.id} was deleted successfully!"
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(
        :title, :body, :user_id
        )
    end

    # def current_resource
    #   if params[:id]
    #     @current_resource ||= Prime.find(params[:id]) 
    #   elsif params[:prime_id]
    #     @current_resource ||= Prime.find(params[:prime_id]) 
    #   end
    # end
end
