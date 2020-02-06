class ContentsController < ApplicationController
  def index
    if params[:tag]
      @contents = Content.tagged_with(params[:tag]).order(created_at: :desc).includes(:taggings, :tags)
    else
      @contents = Content.all.includes(:taggings, :tags)
    end
  end

  def new
    @post=Content.new
  end

  def create
    @post = Content.new(title: post_params[:title],content: post_params[:content])
    @post.save
    @post.tag_list.add(post_params[:tag_list],parse: true)
    @post.save
    redirect_to root_path
  end

  def show
    @content = Content.find(params[:id])
    
  end

  def destroy
    @content = Content.find(params[:id])
    @content.tag_list.remove(@content.tag_list)
    @content.destroy
    @content.save
    redirect_to root_path
  end

  def edit
    @post = Content.find(params[:id])
  end

  def update
    @post = Content.find(params[:id])
    @content_update = @post.update(title: post_params[:title],content: post_params[:content])
    @post.tag_list = post_params[:tag_list]
    @post.save
    @post.reload
    @post.tags

    redirect_to root_path
  end


  private

  def post_params
    params.require(:content).permit(:id,:title, :content, :tag_list)
  end


end
