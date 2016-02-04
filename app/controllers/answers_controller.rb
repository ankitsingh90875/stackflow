class AnswersController < ApplicationController
	def create
		 if member_signed_in?
		  	@post = Post.find(params[:post_id])
		 
		  puts params[:answer]

			@ans = @post.answers.new
			@ans.ans = params[:answer][:ans]
			@ans.commenter=current_member.email
			if @ans.save


		# @post = Post.find(params[:post_id])
   # @ans = @post.answers.create(params[:answer].permit(:commenter, :ans))
    			redirect_to post_path(@post)
  			else
    			redirect_to new_member_session_path
  			end
   
  		end
	end
	private

  def answer_params
    params.require(:answer).permit(:ans)
  end
end 
