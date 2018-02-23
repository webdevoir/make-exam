class QuestionsController < ApplicationController
  # before_action :set_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = Question.all
  end

  def show
  end

  def new
    @exam = Examination.find(params[:examination_id])
    @question = @exa.questions.build
  end

  def edit
  end

  def create
        @exam = Examination.find(params[:examination_id])
        @question = @exa.questions.build(question_params)

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
      params.require(:question).permit(:points, :type, :body, :position)
    end
end
