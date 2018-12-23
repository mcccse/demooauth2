class BucketsController < ApplicationController
  def index
    @buckets = Bucket.all
  end

  def show
    @bucket = Bucket.find(params[:id])
  end

  def new
    @bucket = Bucket.new
  end

  def edit
    @bucket = Bucket.find(params[:id])
  end

  def create
    @bucket = Bucket.new(bucket_params)

    if @bucket.save
      redirect_to @bucket
    else
      render "new"
    end
  end

  def update
    @bucket = Bucket.find(params[:id])

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
