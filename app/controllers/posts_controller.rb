class PostsController < ApplicationController
	def update
    @post = Post.find(params[:id])

    if @post.update(params[:post].permit(:question))
      redirect_to @post
    else
      render 'edit'
    end
  end
	
  def edit
    @post = Post.find(params[:id])
  end

	def index
    @posts = Post.all
   end

	def show
      @post = Post.find(params[:id])
      @post.views=@post.views+1
      @post.save
   end

	def new
    if member_signed_in?

	@posts = Post.new	
  else
    redirect_to new_member_session_path
  end
	end

	def create
  @post = Post.new(post_params)
  @post.commenter=current_member.email
 if @post.save
    redirect_to @post
  else
    render 'new'
end
 end
private
  def post_params
    params.require(:post).permit(:question)
end
end

  
