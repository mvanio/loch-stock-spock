class QuantitiesController < ApplicationController

  def edit
    @batch = Batch.find(params[:id])
    @q=@batch.quantities[]
    respond_to do |format|
      puts @q
      if @batch.quantities.update_attributes(@q)
        format.html { redirect_to @q, notice: 'Quantity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @q.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @batch = Batch.find(params[:id])
    @q = Quantity.find_all_by_batch_id(Quantity.find(params[:id]).batch_id)

    respond_to do |format|
      if @q.update_attributes(params[:id])
        format.html { redirect_to @q, notice: 'Quanitiy was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @q.errors, status: :unprocessable_entity }
      end
    end

  end


end