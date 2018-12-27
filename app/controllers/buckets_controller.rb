class BucketsController < ApplicationController
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action require: :user

  def index
    @buckets = Bucket.where(user_id: current_user.id)
  end

  def show
    @bucket = Bucket.find(params[:id])
    authorize! :show, @bucket
  end

  def new
    @bucket = Bucket.new
  end

  def edit
    @bucket = Bucket.find(params[:id])
  end

  def create
    @bucket = Bucket.new(bucket_params)
    @bucket.user = current_user
    authorize! :create, @bucket

    if @bucket.save
      redirect_to @bucket
    else
      render "new"
    end
  end

  def update
    @bucket = Bucket.find(params[:id])
    authorize! :update, @bucket

    if @bucket.update(bucket_params)
      redirect_to @bucket
    else
      render "edit"
    end
  end

  def destroy
    @bucket = Bucket.find(params[:id])
    @bucket.destroy

    redirect_to buckets_path
  end

  private

  def bucket_params
    params.require(:bucket).permit(:title, :text)
  end
end
