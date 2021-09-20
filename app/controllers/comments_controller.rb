class CommentsController < ApplicationController

  before_action :ensure_authenticated
  before_action :set_tip

  def create
    @comment = Comment.new(comment_params)
    @comment.tip = @tip

    # Needs to be changed: this always sets the User for a Comment to the first
    # User in the database, _not_ the User that POSTed the Comment. 
    @comment.user = current_user

    respond_to do |format|
      # In these format calls, the flash message is being passed directly to
      # redirect_to().  It's a caonvenient way of setting a flash notice or
      # alert without referencing the flash Hash explicitly.
      if @comment.save
        format.html { redirect_to @tip, notice: 'Comment was successfully created.' }
      else
        format.html { redirect_to @tip, alert: 'Unable to create comment.' }
      end
    end
  end

  private

    def set_tip
      @tip = Tip.find(params[:tip_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:body)
    end
end
