class ContentsController < ApplicationController
  def index
    @contents = Content.all.order(created_at: :desc)
  end

  def new
    @post=Content.new
  end

  def create
    Content.create(post_params)
    redirect_to root_path

  end


  private

  def post_params
    params.require(:content).permit(:title, :content)
  end

end
