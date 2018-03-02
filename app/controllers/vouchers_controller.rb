class VouchersController < ApplicationController
  skip_before_action :authenticate_user!, except: [:create, :new]
  def index
    # get the list of all vouchers, then group them by name

    # used to display the filter options
    @categories = Voucher.distinct.pluck(:category)
    @names = Voucher.distinct.pluck(:name)
    @vouchers = []
    @searched_category = params[:category]
    @searched_name = params[:name]

    if !params[:query].nil?
      @vouchers = policy_scope(Voucher).search(params[:query])
    elsif !params[:category].nil?
      @vouchers = policy_scope(Voucher).search(params[:category])
    elsif !params[:name].nil?
        @vouchers = policy_scope(Voucher).search(params[:name])
    else
      @vouchers = policy_scope(Voucher)
    end

    @groups = {}

    @vouchers.each do |voucher|
      if @groups.has_key?(voucher.name)
        @groups[voucher.name] << voucher
      else
        @groups[voucher.name] = []
        @groups[voucher.name] << voucher
      end
    end
  end

  def show_group
    @name = params[:name]
    @group = Voucher.where(name: @name)
  end

  def show
    @voucher = Voucher.find(params[:id])
    @booking = Booking.new()
    authorize @voucher
  end

  def new
   @voucher = Voucher.new
   authorize @voucher
  end

  def create
    @voucher = Voucher.new(voucher_params)
    @voucher.user = current_user
    authorize @voucher
    if @voucher.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
    @voucher = Voucher.find(params[:id])
    authorize @voucher
  end

  def update
    @voucher = Voucher.find(params[:id])
    authorize @voucher
    @voucher.update(voucher_params)
    redirect_to voucher_path
  end

  def destroy
    @voucher = Voucher.find(params[:id])
    authorize @voucher
    @voucher.destroy
    redirect_to dashboard_path
  end

  def no_display
    @voucher = Voucher.find(params[:id])
    authorize @voucher
    @voucher.update(display_flag: false)
    @voucher.save
    redirect_to dashboard_path
  end

  private

  def voucher_params
    params.require(:voucher).permit(:name, :category, :price, :quantity_left, :description, :end_date, :photo, :display)
  end
end
