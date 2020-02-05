class ContentsController < ApplicationController
  def index
    @contents = Content.all.order(created_at: :desc).includes(:tags)
  end

  def new
    @post=Content.new
  end

  def create
    @post = Content.new(title: post_params[:title],content: post_params[:content])
    @post.save
    tag_list = post_params[:tag_name].split(/[[:blank:]]+/)
    @post.save_tags(tag_list)
    redirect_to root_path
  end

  def show
    @content = Content.find(params[:id])
    
  end

  def destroy
    content = Content.find(params[:id])
    # tag_ids = content.tags.ids

    # tag_ids.each do |tag|
    #   Tag.find(tag).destroy
    # end                         ※未実装
    content.destroy
    redirect_to root_path
  end

  def edit
    @post = Content.find(params[:id])
    @tag = @post.tags.name
  end

  def update
    @post = Content.find(params[:id])
    @post = @post.update(title: post_params[:title],content: post_params[:content])
    # tag_list = post_params[:tag_name].split(/[[:blank:]]+/)
    # @post.update_tags(tag_list)
    redirect_to root_path
  end


  private

  def post_params
    params.require(:content).permit(:id,:title, :content, :tag_name)
  end

end
