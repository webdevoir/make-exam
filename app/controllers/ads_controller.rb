class AdsController < ApplicationController
   def new
    @ad = Ad.new
  end

  def create
    @ad = Ad.new(ad_params)
    @ad.status = "pending"

     if @ad.save && current_user.role == "Admin"
      redirect_to admin_ads_path, notice: "Ad Submitted successfully!"
     elsif @ad.save
        redirect_to root_path, notice: "Ad Submitted successfully!"
      else
        flash[:error] = @ad.errors.full_messages.to_sentence
        render :new, notice: "Ad could not be created!"
      end
  end

  def edit
  	 @ad = Ad.find(params[:id])
  end

  def update
   	@ad = Ad.find(params[:id])
    if @ad.update_attributes(ad_params) && current_user.role == "Admin"
      redirect_to admin_ads_path, notice: "Ad Submitted successfully!"
    elsif @ad.update_attributes(ad_params)
      redirect_to root_path, notice: "Ad updated successfully"
    else
      flash[:error] = "#{@ad.errors.count} errors prevented certificate from being updated."
      render :edit
    end

  end

  def destroy
  	@ad = Ad.find(params[:id])
  	@ad.destroy
  	 redirect_to root_path, notice: "#{@ad.id} was deleted successfully!"
  end

    protected

      def ad_params
        params.require(:ad).permit(:id, :compname, :email, :contact, :phoneno, :age, :image, :url, :status, :countries => [], :months => [])
      end
end

