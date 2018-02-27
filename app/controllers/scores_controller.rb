class ScoresController < ApplicationController
	def new
	    @exam = Examination.find(params[:examination_id])
	    @score = @exam.scores.build(user_id: current_user.id)
	    @exam.questions.each do |question|
	    	res = @score.responses.build(question_id: question.id)
	    	logger.info question.id
	    	logger.info res

	    end
	end

  def create
  	@exam = Examination.find(params[:examination_id])

  	@score = @exam.scores.build(score_params)
  	if @score.save
        redirect_to examination_score_path(@exam, @score)
    else
      logger.info "################################################"
      logger.info @score.errors.full_messages
      redirect_to root_path, error: "#{@score.errors.full_messages} errors prevented this profile from being created"
    end
  end

  def show
    @score = Score.find(params[:id])
    @exam = @score.examination
     res = @score.responses
      @correct_res = []
      @correct_pts = 0
      @total_pts = @exam.questions.sum(:points)
      res.each do |res|
      	if res.answer.correct
      		@correct_res.push res.id
      		points = res.question.points
      		@correct_pts = @correct_pts + points
      	end
      @percent = (@correct_pts.to_f / @total_pts.to_f) * 100
      end
      logger.info "################################################"
      logger.info "correct questions = #{@correct_res.count}"
      logger.info "correct responses = #{@correct_res}"
      logger.info "score = #{@correct_pts} / #{@total_pts}"
      logger.info @percent

  end

   protected

      def score_params
        params.require(:score).permit(:examination_id, :user_id,
          responses_attributes: [:id, :answer_id, :question_id, :selected])
      end
end
