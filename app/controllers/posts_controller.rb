class PostsController < ApplicationController
	def refresh
		
		@activities = Activity.find(:all, :order => "id desc", :limit => 8)
		 respond_to do |format|
    format.js
  end
end

	def update
    @post = Post.find(params[:id])

    if @post.update(params[:post].permit(:question))
    	@act = Activity.new
  @act.doer=current_member.email
  @act.activity="edited"
  @act.acted_on=@post.id
  @act.save 
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
@activities = Activity.find(:all, :order => "id desc", :limit => 8)
		#@activities = Activities.all
		
   end

	def show 
	 if member_signed_in?

 
      @post = Post.find(params[:id])
      @post.views=@post.views+1
      @post.save

      if(@post.commenter != current_member.email)
      @act = Activity.new 
   @act.doer=current_member.email
  @act.activity="viewed"
  @act.post_id=@post.id
  @act.save 
end
@activities = Activity.find(:all, :order => "id desc", :limit => 8)
 else
    redirect_to new_member_session_path
  end
   end

	def new
    if member_signed_in?
@activities = Activity.find(:all, :order => "id desc", :limit => 8)
	@posts = Post.new	
  else
    redirect_to new_member_session_path
  end
	end

	def create
  
  @post = Post.new(post_params)
  @post.commenter=current_member.email

 if @post.save
 	@act = Activity.new
  @act.doer=current_member.email
  @act.activity="posted a question"
  @act.post_id =@post.id
  @act.save 
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

  
