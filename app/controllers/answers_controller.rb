class AnswersController < ApplicationController
 
 def index
    @answers = Answer.all
  end

  def show
  end

  def new
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build
  end

  def edit
    @answer  = Answer.find(params[:id])
    @question = Question.where(id: @answer.Question_id).first
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(answer_params)
    if @question.answers.count > 0
      @answer.position = 1
    else 
      @answer.position = @question.answers.count + 1 
    end

    if @answer.save
      redirect_to @question, notice: "answer created successfully"
    else
      render :new
    end
  end

  def update
    @question = Question.find(params[:question_id])
    @answer  = Answer.find(params[:id])

    if @answer.update_attributes(answer_params)
      redirect_to @question, notice: "answer updated successfully"
    else
      flash[:error] = "#{@answer.errors.count} errors prevented answer from being updated."
      render :edit
    end

  end

  def destroy
    @answer  = Answer.find(params[:id])
      @answer.destroy
      flash[:alert] =  "The answer was deleted successfully!"
      redirect_back(fallback_location: questions_path)
  end

  private

    def answer_params
      params.require(:answer).permit(:points, :answer_type, :body, :position)
    end
end
