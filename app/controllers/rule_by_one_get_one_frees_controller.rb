class RuleByOneGetOneFreesController < ApplicationController
  before_action :set_rule_by_one_get_one_free, only: [:show, :edit, :update, :destroy]

  # GET /rule_by_one_get_one_frees
  # GET /rule_by_one_get_one_frees.json
  def index
    @rule_by_one_get_one_frees = RuleByOneGetOneFree.all
  end

  # GET /rule_by_one_get_one_frees/1
  # GET /rule_by_one_get_one_frees/1.json
  def show
  end

  # GET /rule_by_one_get_one_frees/new
  def new
    @rule_by_one_get_one_free = RuleByOneGetOneFree.new
  end

  # GET /rule_by_one_get_one_frees/1/edit
  def edit
  end

  # POST /rule_by_one_get_one_frees
  # POST /rule_by_one_get_one_frees.json
  def create
    @rule_by_one_get_one_free = RuleByOneGetOneFree.new(rule_by_one_get_one_free_params)

    # respond_to do |format|
    #   if @rule_by_one_get_one_free.save
    #     format.html { redirect_to @rule_by_one_get_one_free, notice: 'Rule by one get one free was successfully created.' }
    #     format.json { render :show, status: :created, location: @rule_by_one_get_one_free }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @rule_by_one_get_one_free.errors, status: :unprocessable_entity }
    #   end
    # end
    @rule_by_one_get_one_free.save
    redirect_to offers_constructor_url
  end

  # PATCH/PUT /rule_by_one_get_one_frees/1
  # PATCH/PUT /rule_by_one_get_one_frees/1.json
  def update
    respond_to do |format|
      if @rule_by_one_get_one_free.update(rule_by_one_get_one_free_params)
        format.html { redirect_to @rule_by_one_get_one_free, notice: 'Rule by one get one free was successfully updated.' }
        format.json { render :show, status: :ok, location: @rule_by_one_get_one_free }
      else
        format.html { render :edit }
        format.json { render json: @rule_by_one_get_one_free.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rule_by_one_get_one_frees/1
  # DELETE /rule_by_one_get_one_frees/1.json
  def destroy
    @rule_by_one_get_one_free.destroy
    # respond_to do |format|
    #   format.html { redirect_to rule_by_one_get_one_frees_url, notice: 'Rule by one get one free was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
    redirect_to offers_constructor_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rule_by_one_get_one_free
      @rule_by_one_get_one_free = RuleByOneGetOneFree.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rule_by_one_get_one_free_params
      params.require(:rule_by_one_get_one_free).permit(:product_code)
    end
end
