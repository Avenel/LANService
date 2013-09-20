class OrdersController < ApplicationController
  before_filter :authenticate_user!
  
  @@ordering_allowed = true;
  @@ordering_end = Time.new;

  # GET /orders
  # GET /orders.json
  def index

    @ordering_end = @@ordering_end
    @ordering_allowed = @@ordering_allowed

    if current_user.has_role? :admin then 
      @users = User.all
      @orders = Order.all
    else
      @users = Array.new
      @users.push(current_user)
      @orders = Order.where("orderer = ?", current_user.id)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])

    @vendor_name = Vendor.find(@order.vendor).name
    @orderer_name = User.find(@order.orderer).name

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    if Vendor.all.empty? then
      redirect_to orders_url, :notice => 'Please create a Vendor first!'
      return
    end

    if !@@ordering_allowed then
      redirect_to orders_url, :notice => 'Ordering time expired. Please ask Admin for a new one!'
      return
    end

    @order = Order.new

    @vendors_arr = getVendors

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])#

    if @order.orderer != current_user.id && !(current_user.has_role? :admin) then
      redirect_to orders_url, :notice => 'You are not the origin creator of this order!'
    end

    @vendors_arr = getVendors
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(params[:order])

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])

    if @order.orderer != current_user.id && !(current_user.has_role? :admin) then
      redirect_to orders_url, :notice => 'You are not the origin creator of this order!'
      return
    end

    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  def getVendors
    @vendors = Vendor.find(:all)

    vendors_arr = Array.new
    @vendors.each do |vendor|
      vitem = Array.new
      name = vendor.name
      id = vendor.id
      vitem.push(name)
      vitem.push(id)
      vendors_arr.push(vitem)
    end

    return vendors_arr
  end

  def toggleOrderingAllowed
    @@ordering_allowed = (params[:order][:orderingAllowed].to_i == 1) ? true : false
    
    year = params[:order]["ordering_end(1i)"].to_i
    month = params[:order]["ordering_end(2i)"].to_i
    day =params[:order]["ordering_end(3i)"].to_i
    hour = params[:order]["ordering_end(4i)"].to_i
    minute = params[:order]["ordering_end(5i)"].to_i

    @@ordering_end = DateTime.new(year,month,day,hour,minute)

    redirect_to orders_url, :notice => 'OrderingAllowed changed.' + @@ordering_allowed.to_s + @@ordering_end.to_time().getlocal().strftime("%Y-%m-%d %H:%M:%S")
  end
end
