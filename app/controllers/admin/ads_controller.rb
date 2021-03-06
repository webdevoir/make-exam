class Admin::AdsController < Admin::BaseAdminController
  def index
    @ads = Ad.all
  end

  def new
    @ad = Ad.new
    @date = Date.today
    @months = []
    (0..11).each do |m|
      @months << [@date.next_month(m).strftime("%b %Y"), @date.next_month(m).strftime("%b %Y")]
    end
  end

  def create
    @ad = Ad.new(ad_params)
    @ad.status = "inactive"

     if @ad.save
        redirect_to admin_ads_path, notice: "Ad Submitted successfully!"
      else
        flash[:error] = @ad.errors.full_messages.to_sentence
        render :new, notice: "Ad could not be created!"
      end
  end

  def edit
  	 @ad = Ad.find(params[:id])
    @date = Date.today
    @months = []
    (0..11).each do |m|
      @months << [@date.next_month(m).strftime("%b %Y"), @date.next_month(m).strftime("%b %Y")]
    end
  end

  def update
   	@ad = Ad.find(params[:id])
    if @ad.update_attributes(ad_params)
      redirect_to admin_ads_path, notice: "Ad updated successfully"
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

  def activate 
    @ad = Ad.find(params[:ad_id])
    if @ad.status == "active"
      @ad.status = "inactive"
    else
      @ad.status = "active"
    end
    if @ad.save
      redirect_to admin_ads_path,  notice: "ad:#{@ad.id}'s' status has been changed to #{@ad.status.capitalize}"
    else
      flash[:error] = "#{@ad.errors.count} errors prevented this job from being updated"
      redirect_to admin_ads_path
    end
  end  

  def payment
    # @ad = Ad.find(params[:id])
    @ad = Ad.find(params[:ad_id])
    # @ad = Ad.find(10)
    MainMailer.ad_pay_request(@ad).deliver
    redirect_to admin_ads_path,  notice: "Payment request sent"
  end

    protected

      def ad_params
        params.require(:ad).permit(:page, :id, :compname, :email, :contact, :phoneno, :age, :image, :url, :status,  :countries => [], :months => [])
      end
end
