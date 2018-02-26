class ScoresController < ApplicationController
	def new
	    @exam = Examination.find(params[:examination_id])
	    @score = @exam.scores.build(user_id: current_user.id)
	    # @score = Score.new
	    @exam.answers.each { |ans| @score.responses.build(answer_id: ans.id) }
	end

  def create
  	@exam = Examination.find(params[:examination_id])

  	@score = @exam.scores.build(user_id: current_user.id)
  	if @score.save
        redirect_to examination_path(@exam)
    else
      render :new
    end
  end

   protected

      def score_params
        params.require(:examination).permit(
          responses_attributes: [:id, :_destroy, :answer_id])
      end
end
