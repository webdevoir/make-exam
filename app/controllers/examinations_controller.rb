class ExaminationsController < ApplicationController
  def index
    @exams = Examination.all
  end

  def show
    @exam = Examination.find(params[:id])
  end

  def new
    @exam = Examination.new
  end

  def edit
    @exam = Examination.find(params[:id])
  end

  def create
    @exam = Examination.new(exam_params)

    if @exam.save
      redirect_to examinations_path
    else
      render :new
    end
  end

  def update
    @exam = Examination.find(params[:id])

    if @exam.update_attributes(exam_params)
      redirect_to exam_path(@exam)
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
          :name, :intro, :conclusion, :passcode
        )
      end
end
