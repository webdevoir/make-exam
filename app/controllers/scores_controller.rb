class ScoresController < ApplicationController
	def new
	    @exam = Examination.find(params[:examination_id])
	    @score = @exam.scores.build(user_id: current_user.id)
	    @exam.questions.each do |question|
	    	res = @score.responses.build(question_id: question.id)
	    	logger.info question.id
	    	logger.info res

	    end
      #  @exam.answers.each do |ans|
      #   res = @score.responses.build(question_id: ans.question.id)
      #   logger.info question.id
      #   logger.info res

      # end
	end

  def create
  	@exam = Examination.find(params[:examination_id])

  	@score = @exam.scores.build(score_params)
  	if @score.save
        redirect_to examination_score_path(@exam, @score)
    else
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
        if res.question.question_type == "Multiple Response"
          multi_correct = []
          res.question.answers.each do |ans|
              multi_correct.push ans.id if ans.correct 
          end
          if multi_correct.sort == res.answer_ids.sort
            @correct_res.push res.id
            points = res.question.points
            @correct_pts = @correct_pts + points
          end

        elsif res.question.question_type == "Fill in the blank"
          ques_fill_blank = res.question.answers.first.body
          if  ques_fill_blank && res.question.answers.first.correct
            if  ques_fill_blank == res.fill_blank
              @correct_res.push res.id
              points = res.question.points
              @correct_pts = @correct_pts + points
            end
          end

        else

        	if res.answer_ids.length <= 1
            answer = Answer.find_by(id: res.answer)
            if  answer && answer.correct
          		@correct_res.push res.id
          		points = res.question.points
          		@correct_pts = @correct_pts + points
            end
        	end
        end
      
      @percent = (@correct_pts.to_f / @total_pts.to_f) * 100
      end
      # logger.info "################################################"
      # logger.info "correct questions = #{@correct_res.count}"
      # logger.info "correct responses = #{@correct_res}"
      # logger.info "score = #{@correct_pts} / #{@total_pts}"
      logger.info @percent
  end

  def user_scores
    @user = User.find_by(id: current_user.id)
    @scores = Score.where(user_id: @user.id)
  end

   protected

      def score_params
        params.require(:score).permit(:examination_id, :user_id,
          responses_attributes: [:id, :question_id, :selected, :answer, :fill_blank, :answer_ids => []])
      end
end
