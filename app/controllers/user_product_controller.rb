class UserProductController < ApplicationController
   
    def create
        @new_user_product = UserProduct.new
        

        @new_user_product.user_id = current_user.id 
        @new_user_product.product_id = params[:product_id]
        @new_user_product.lot = 1

        @new_user_product.save
        @product = Product.find(params[:product_id])
        @product.stock = @product.stock - 1
        @product.save
        redirect_to product_path(id: params[:product_id])
    end

       
    def destroy
        @user_product = UserProduct.where(puroduct_id: params[:id],user_id: current_user.id).first
        @user_product.delete
        redirect_to product_path(id: params[:product_id])
    end

    private
    def user_product_params
        params.require(:user_product).permit(:user_id, :pruduct_id, :lot)
    end    

end
