class QuestionsController < ApplicationController
  # before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :redirect_cancel, only: [:create, :update]

  def index
    @questions = Question.all
  end

  def show
    @exam = Examination.find(params[:examination_id])
    @question  = Question.find(params[:id])
     @score = @exam.scores.build(user_id: current_user.id)
      # @exam.questions.each do |question|
        res = @score.responses.build(question_id: @question.id)
      #   logger.info question.id
      #   logger.info res

      # end
  end

  def new
    @exam = Examination.find(params[:examination_id])
    @question = @exam.questions.build
    (1..4).each do |n|
      ans =  @question.answers.build
      ans.order = n
    end
  end

  def edit
    @question  = Question.find(params[:id])
    @exam = Examination.where(id: @question.examination_id).first
  end

  def create
    @exam = Examination.find(params[:examination_id])
    @question = @exam.questions.build(question_params)
    ans_params = params[:question][:answers_attributes]
    @correct_ans = false
    ans_params.each do |k, v|
      # logger.info "##########################################"
      # logger.info v
      if @correct_ans == false
       @correct_ans =  v.has_key?(:correct)
      end
     # logger.info @correct_ans
    end

    if @exam.questions.count > 0
      @question.position = @exam.questions.count + 1 
    else 
      @question.position = 1
    end

    # logger.info "##########################################"
    # logger.info "correct ans ==> #{@correct_ans}"
    # logger.info "##########################################"
    # if @correct_ans == true && @question.save
    if @question.save
      # logger.info "#############   question saved and correct ans #################"
      redirect_to @exam, notice: "question created successfully"
    # elsif @question.save
    #   # logger.info "#############   question saved and no correct ans #################"
    #   flash[:error] = "You need a correct answer"
    #   render :new
    else
      # logger.info "#############   question not saved #################"
      render :new
    end
  end

  def update
    @exam = Examination.find(params[:examination_id])
    @question  = Question.find(params[:id])
    if params["add"] && @question.update_attributes(question_params)
      redirect_to new_examination_question_path(@exam), notice: "question updated successfully"
    elsif @question.update_attributes(question_params)
      flash[:alert] =  "The question was updated successfully!"
    else
      flash[:error] = "#{@question.errors.count} errors prevented question from being updated."
      render :edit
    end

  end

  def destroy
    @question  = Question.find(params[:id])
      @question.destroy
      flash[:alert] =  "The question was deleted successfully!"
      redirect_back(fallback_location: examinations_path)
  end


  private

    def question_params
      params.require(:question).permit(:points, :question_type, :body, :position, 
        answers_attributes: [:id, :_destroy, :points, :type, :body, :correct])
    end

    def redirect_cancel
      @exam = Examination.find(params[:examination_id])
      redirect_to examination_path(@exam) if params[:cancel]
    end


end
