class QuestionWeightsController < ApplicationController
  before_action :set_question_weight, only: [:show, :edit, :update, :destroy]

  # GET /question_weights
  # GET /question_weights.json
  def index
    @question_weights = QuestionWeight.all
  end

  # GET /question_weights/1
  # GET /question_weights/1.json
  def show
  end

  # GET /question_weights/new
  def new
    @question_weight = QuestionWeight.new
  end

  # GET /question_weights/1/edit
  def edit
  end

  # POST /question_weights
  # POST /question_weights.json
  def create
    @question_weight = QuestionWeight.new(question_weight_params)

    respond_to do |format|
      if @question_weight.save
        format.html { redirect_to @question_weight, notice: 'Question weight was successfully created.' }
        format.json { render action: 'show', status: :created, location: @question_weight }
      else
        format.html { render action: 'new' }
        format.json { render json: @question_weight.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /question_weights/1
  # PATCH/PUT /question_weights/1.json
  def update
    respond_to do |format|
      if @question_weight.update(question_weight_params)
        format.html { redirect_to @question_weight, notice: 'Question weight was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @question_weight.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /question_weights/1
  # DELETE /question_weights/1.json
  def destroy
    @question_weight.destroy
    respond_to do |format|
      format.html { redirect_to question_weights_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question_weight
      @question_weight = QuestionWeight.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_weight_params
      params.require(:question_weight).permit(:expert_id, :question_id, :weight)
    end
end
