class ProductsController < ApplicationController
  # GET /products
  # GET /products.json
  add_breadcrumb "Browse products", "/products", except: [:home,:reports]
  add_breadcrumb "New Product", "/products/new", only: [:new, :create, :show]
  add_breadcrumb "Edit Product", "/products/edit", only: [:edit]
  add_breadcrumb "Search Results", "/products/search_results", only: [:search_results]
  
  require 'date'
  def reports
    a = Date.today
    @products = Product.all
    @exproduct = Product.where("expired_on < ?", a+30)
  end
    

  def home
    a = Date.today
    
    @products=Product.all
    
    @exproduct = Product.where("expired_on < ?", a+30)
    
    #@rd = params[:product] && params[:product][:expired_on]
    #@remain_days = params[:product][:expired_on]
  

  end
  def index
    @products = Product.all
    @products = Product.order("id").page(params[:page]).per(5)
    @vendors = Vendor.all
    #@vendors = Vendor.find(params[:id])

    # q = Product.where(params[:product_name])
    # #q = params[:product][:product_name]
    #   @search_results = Product.find(:all, :conditions => ['product_name LIKE ?', "%#{q}%"]) 

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  def search_results

    q = params[:product][:product_name]
    @search_results = Product.find(:all, :conditions => ['product_name LIKE ?', "%#{q}%"])
  
  end
  # GET /products/1
  # GET /products/1.json
  def show
    
    @product = Product.find(params[:id])
    @vendors = Vendor.all
    @vendors = Vendor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new
    

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
 
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    #@product = Product.new(params[:product])
    #@product = Product.create(vendor_id: @vendor.id)
    @vendor = Vendor.all
    @product = @vendor.products.create()
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])
  

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
    end
    def delete_product
     #Product.destroy(params[:product])
     #@product = Product.where(params[:id])
     #@product = Product.all
     #@product.delete(params[:product_id])

     @products = Product.find(params[:product_ids])

     @products.each do |product|    
      product.destroy
      flash[:alert] = "Selected products deleted successfully.."
    end
      respond_to do |format|
        format.html {redirect_to products_url}
      end
    end
end
