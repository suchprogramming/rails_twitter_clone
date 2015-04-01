class TweetsController < ApplicationController

  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = current_user.tweets.new(tweet_params)
    if @tweet.save
      respond_to do |format|
        format.html { redirect_to tweets_path }
        format.js { flash.now[:success] = "Tweet Added!" }
      end
    else
    end
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:id])
    if current_user.id == @tweet.user_id
      @tweet.update(tweet_params)
      flash[:success] = 'Tweet Successfully Updated!'
      redirect_to tweets_path
    else
      render :edit
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    if current_user.id == @tweet.user_id
      @tweet.destroy
      flash[:success] = 'Tweet Successfully Deleted!'
      redirect_to tweets_path
    else
      flash[:danger] = "Not So Fast!"
      redirect_to tweets_path
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:tweet_text, :username, :handle)
  end

end
