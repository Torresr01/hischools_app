class CommentsController < ApplicationController

	def create
    @school = School.find(params[:school_id])
    @comment = @school.comments.create(comment_params)
    redirect_to school_path(@school)
  end
 
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
  end

end
