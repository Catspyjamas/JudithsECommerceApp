class ProductsController < ApplicationController
  before_action :authorize_admin, except: %i(show index)
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :purge_redis_product_index, only: [:create, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    logger.debug "getting the search word and displaying corresponding items"
    if params[:q]
      search_term = params[:q]
      logger.debug "Collected search term: #{search_term}"
      @products = Product.search(search_term)
      logger.debug "Displaying corresponding items: #{@products}"
    else
      @products = $redis.get("product_index")
      if @products == nil
        @products = Product.all
        $redis.set("product_index", Marshal.dump(@products))
      else
        @products = Marshal.load @products
      end
    end
  end


  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
    @comments = @product.comments.paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    def purge_redis_product_index
      $redis.del("product_index")
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :image_url, :toxicity, :price)
    end

    def authorize_admin
      if current_user.blank?
        redirect_to user_session_path, alert: 'You have to be logged in to do that.'
      elsif !current_user.admin?
        redirect_to root_path, alert: 'Sorry, only admins can do that.'
      end
    end
end
