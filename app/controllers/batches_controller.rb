class BatchesController < ApplicationController
  # GET /batches
  # GET /batches.json
  def index
    @batches = Batch.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @batches }
    end
  end

  # GET /batches/1
  # GET /batches/1.json
  def show
    @batch = Batch.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @batch }
    end
  end

  # GET /batches/new
  # GET /batches/new.json
  def new
    @batch = Batch.new
    # @quantities = @batch.quantities.build
    @products = @batch.products.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @batch }
    end
  end

  # GET /batches/1/edit
  def edit
    @batch = Batch.find(params[:id])
    # @product = @batch.quantities.build.build_product
  end

  # POST /batches
  # POST /batches.json
  def create
    puts "create"
    @batch = Batch.new(batch_params)
    respond_to do |format|
      if @batch.save
        @pb = Quantity.find_by_batch_id(@batch.id)
        format.html { redirect_to batches_path(), notice: 'Batch was successfully created.' }
        format.json { render json: @batch, status: :created, location: @batch }
      else
        format.html { render action: "new" }
        format.json { render json: @batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /batches/1
  # PUT /batches/1.json
  def update
    puts "update"
    @batch = Batch.find(params[:id])
    respond_to do |format|
      if @batch.update_attributes(batch_params)
        # @pb = Quantity.find_by_batch_id(@batch.id)
        format.html { redirect_to batches_path, notice: 'Batch was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /batches/1
  # DELETE /batches/1.json
  def destroy
    @batch = Batch.find(params[:id])
    @batch.destroy

    respond_to do |format|
      format.html { redirect_to batches_url }
      format.json { head :no_content }
    end
  end

  private 
    def batch_params
      params.require(:batch).permit(:id, :name, :due_date, :description, :order_date,:arrival_date, products_attributes: [:id, :sku, :quantities, :description ] )
    end
end
