class FoodsController < ApplicationController
    def index
        @foods = Food.all
    end

    def new 
        @new_food = Food.new
    end

    def destroy
        food = Food.find(params[:id])
        if food.destroy
            flash.now[:notice] = 'food was successfully destroyed'
        else
            flash.now[:alert] = 'food could not be removed'
        end
        redirect_to user_foods_url
    end


    def create
        @food = Food.new(food_params)

        respond_to do |format|
            format.html do
                if @food.save!
                    redirect_to user_foods_url
                else
                    redirect_to new_user_food_path(current_user)
                end
            end
        end
    end



    def food_params
        params.require(:food).permit(:name, :measurement_unit, :price, :quantity).merge(user_id: current_user.id)
    end
end
