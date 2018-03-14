class PostsController < ApplicationController

  before_action :require_login

  def new
    @subs = Sub.all
    @post = Post.new
    render :new
  end

  def create
    @post = Post.new(post_params)

    @post.user_id = current_user.id
    # @post.sub_ids = params[:sub_ids]

    if @post.save
      params[:sub_ids].each do |sub_id|
        PostSub.create(post_id: @post.id, sub_id: sub_id.to_i)
      end
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to new_sub_url
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy!
    redirect_to sub_url(@post.sub)
  end

  def edit
    render :edit
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      render :edit
    end

  end

  def show
    @post = Post.find(params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:title, :url, :content)
  end
end
