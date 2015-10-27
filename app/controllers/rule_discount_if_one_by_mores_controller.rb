class RuleDiscountIfOneByMoresController < ApplicationController
  before_action :set_rule_discount_if_one_by_more, only: [:show, :edit, :update, :destroy]

  # GET /rule_discount_if_one_by_mores
  # GET /rule_discount_if_one_by_mores.json
  def index
    @rule_discount_if_one_by_mores = RuleDiscountIfOneByMore.all
  end

  # GET /rule_discount_if_one_by_mores/1
  # GET /rule_discount_if_one_by_mores/1.json
  def show
  end

  # GET /rule_discount_if_one_by_mores/new
  def new
    @rule_discount_if_one_by_more = RuleDiscountIfOneByMore.new
  end

  # GET /rule_discount_if_one_by_mores/1/edit
  def edit
  end

  # POST /rule_discount_if_one_by_mores
  # POST /rule_discount_if_one_by_mores.json
  def create
    @rule_discount_if_one_by_more = RuleDiscountIfOneByMore.new(rule_discount_if_one_by_more_params)

    # respond_to do |format|
    #   if @rule_discount_if_one_by_more.save
    #     format.html { redirect_to @rule_discount_if_one_by_more, notice: 'Rule discount if one by more was successfully created.' }
    #     format.json { render :show, status: :created, location: @rule_discount_if_one_by_more }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @rule_discount_if_one_by_more.errors, status: :unprocessable_entity }
    #   end
    # end
    @rule_discount_if_one_by_more.save
    redirect_to offers_constructor_path
  end

  # PATCH/PUT /rule_discount_if_one_by_mores/1
  # PATCH/PUT /rule_discount_if_one_by_mores/1.json
  def update
    respond_to do |format|
      if @rule_discount_if_one_by_more.update(rule_discount_if_one_by_more_params)
        format.html { redirect_to @rule_discount_if_one_by_more, notice: 'Rule discount if one by more was successfully updated.' }
        format.json { render :show, status: :ok, location: @rule_discount_if_one_by_more }
      else
        format.html { render :edit }
        format.json { render json: @rule_discount_if_one_by_more.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rule_discount_if_one_by_mores/1
  # DELETE /rule_discount_if_one_by_mores/1.json
  def destroy
    @rule_discount_if_one_by_more.destroy
    # respond_to do |format|
    #   format.html { redirect_to rule_discount_if_one_by_mores_url, notice: 'Rule discount if one by more was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
    redirect_to offers_constructor_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rule_discount_if_one_by_more
      @rule_discount_if_one_by_more = RuleDiscountIfOneByMore.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rule_discount_if_one_by_more_params
      params.require(:rule_discount_if_one_by_more).permit(:product_code, :min_count, :discount)
    end
end
