class QuestionsController < ApplicationController
  # before_action :set_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = Question.all
  end

  def show
  end

  def new
    @exam = Examination.find(params[:examination_id])
    @question = @exam.questions.build
  end

  def edit
  end

  def create
        @exam = Examination.find(params[:examination_id])
        @question = @exam.questions.build(question_params)
        if @exam.questions.count > 0
          @question.position = 1
        else @question.position = @exam.questions.count + 1 

        if @question.save
          redirect_to @exam, notice: "question created successfully"
        else
          render :new
        end
      end

  def update

  end

  def destroy
    @question  = Question.find(params[:id])
      @question.destroy
      flash[:alert] =  "The question was deleted successfully!"
      redirect_back(fallback_location: root_path)
  end

  private

    def question_params
      params.require(:question).permit(:points, :question_type, :body, :position)
    end
end
