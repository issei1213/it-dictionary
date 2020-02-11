class ContentsController < ApplicationController
  def index
      if params[:tag]
        @contents = Content.order(created_at: :DESC).tagged_with(params[:tag]).includes(:taggings, :tags)
      else
        @contents = Content.all.order(created_at: :DESC).includes(:taggings, :tags)
      end
      @tags = ActsAsTaggableOn::Tag.most_used(20)
  end

  def new
    @post = Content.new
  end

  def create
    @post = Content.new(post_params)
    @post.save
    @post.tag_list.add(post_params[:tag_list],parse: true)
    @post.save
    redirect_to root_path
  end

  def show
    @content = Content.find(params[:id])
    @like = Like.new
    
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
    @content_update = @post.update(post_params)
    @post.tag_list = post_params[:tag_list]
    @post.save
    @post.reload
    @post.tags
    redirect_to root_path
  end

  def search_title
    @contents = Content.search_title(params[:keyword])
    @tag = @contents.new
    respond_to do |format|
      format.html
      format.json

    end
  end

  def search_content
    @contents = Content.search_content(params[:keyword])
    respond_to do |format|
      format.html
      format.json
    end
  end

  private

  def post_params
    params.require(:content).permit(:title, :content, :tag_list).merge(user_id: current_user.id)
  end


end
