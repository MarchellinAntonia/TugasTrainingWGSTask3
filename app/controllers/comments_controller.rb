class CommentsController < ApplicationController
  def index
	@comments = Comments.all
	#@comments = Comments.comment_per_article_id
  end

  def new
	@comments = Comment.new
  end

  def edit
  end

def create

    @comments = Comment.new(params_comment)

    if @comments.save
        flash[:notice] = "Success Add Records"
        redirect_to action: 'index'
    else
        flash[:error] = "data not valid"
        render 'new'
    end

end

def update

 @comments = Comment.find_by_id(params[:id])

 if @comments.update(params_comment)

    flash[:notice] = "Success Update Records"

    redirect_to action: 'index'

 else

    flash[:error] = "data not valid"

    render 'edit'

 end

end

def destroy

    @comments = Comment.find_by_id(params[:id])

    if @comments.destroy

        flash[:notice] = "Success Delete a Records"

        redirect_to action: 'index'

    else

        flash[:error] = "fails delete a records"

        redirect_to action: 'index'

    end

end

private

    def params_comment

        params.require(:comment).permit(:article_id, :user_is, :content)

    end



end
