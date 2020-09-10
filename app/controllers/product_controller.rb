class ProductController < ApplicationController
    def index
        @product = Product.all
    end
    def new
        @product = Product.new
        
    end
    def create
        @new_product = Product.new(product_params)
        @new_product.user_id = current_user.id
        @new_product.save

        #tag_ids = params[:tweet][:tags]
        #tag_ids.each do |t_id|
         #   TagTweet.create(tag_id: t_id, tweet_id: @new_tweet.id)
        #end

        redirect_to root_path
    end
    def show
        @product = Product.find(params[:id])
        @user_product = UserProduct.all
       # tag_tweets = TagTweet.where(tweet_id: @tweet.id)
       # @tags = []
       # tag_tweets.each do |tt|
        #    @tags << Tag.find(tt.tag_id)
        #end
    end   

    def destroy
        @product = Product.find(params[:id])
        @product.delete
        redirect_to root_path
    end

    def edit
        @product = Product.find(params[:id])
    end
    def update
        @edit_product = Product.find(params[:id])
        @edit_product.update(product_params)
        @edit_product.save
        redirect_to root_path
    end

    private
    def product_params
        params.require(:product).permit(:product_name,:body,:stock,:money,:user_id)
    end    


end
