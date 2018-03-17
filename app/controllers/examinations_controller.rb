class ExaminationsController < ApplicationController
  def index
    if params[:search]
      @exams = Examination.search(params[:search])
        # @jobs = @jobs.order(:created_at).reverse_order.page(params[:page]).per(15) 
    elsif params[:user_exams]
      @exams = Examination.where(user_id: current_user.id)
    else
      @exams = Examination.all
      # @jobs = @jobs.order(:created_at).reverse_order.page(params[:page]).per(15) 
    end
  end

  def show
    @exam = Examination.find(params[:id])
  end

  def take
    @exam = Examination.find(params[:id])
    @score = @exam.scores.build
    @score.user_id = current_user.id
    @score.save
  end

  def new
    @exam = Examination.new
    @exam = current_user.examinations.build
  end

  def edit
    @exam = Examination.find(params[:id])
  end

  def create
    @exam = current_user.examinations.new(exam_params)

    if @exam.save
      redirect_to examinations_path
    else
      logger.info @exam.errors.full_messages
      render :new
    end
  end

  def update
    @exam = Examination.find(params[:id])

    if @exam.update_attributes(exam_params)
      redirect_to examination_path(@exam)
    else
      render :edit
    end
  end

  def destroy
    @exam = Examination.find(params[:id])
    @exam.destroy
    redirect_to exams_path
  end

   protected

      def exam_params
        params.require(:examination).permit(
          :name, :intro, :conclusion, :passcode, :password, :password_confirmation,
          responses_attributes: [:id, :_destroy, :answer_id])
      end
end
