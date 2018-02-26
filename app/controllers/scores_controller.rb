class ScoresController < ApplicationController
	def new
	    @exam = Examination.find(params[:examination_id])
	    @score = @exam.scores.build(user_id: current_user.id)
	    # @exam.questions.each { |question| @score.responses.build(question_id: question.id) }
	    @exam.questions.each do |question|
	    	res = @score.responses.build(question_id: question.id)
	    	logger.info question.id
	    	logger.info res
	    # @exam.answers.each do |ans| 
	    # 	res = @score.responses.build
	    # 	res.answer_id = ans.id
	    # 	logger.info ans.id
	    # 	logger.info res
	    # end

	    # (1..4).each do |n|
	    #   res =  @score.responses.build
	    end
	end

  def create
  	@exam = Examination.find(params[:examination_id])

  	@score = @exam.scores.build(score_params)
  	if @score.save
        redirect_to examination_path(@exam)
    else
      logger.info "################################################"
      logger.info @score.errors.full_messages
      redirect_to root_path, error: "#{@score.errors.full_messages} errors prevented this profile from being created"
    end
  end

   protected

      def score_params
        params.require(:score).permit(:examination_id, :user_id,
          responses_attributes: [:id, :answer_id, :question_id, :selected])
      end
end
