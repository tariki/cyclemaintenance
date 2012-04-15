class QuestionsController < ApplicationController

  def index
    @questions = Question.paginate(:page => params[:page], :per_page => 10)
    @title = "FAQ"
  end

  def new
    @question = Question.new
    @title = "Register a new faq"
  end

  def create
    @question = Question.new(params[:question])

    if @question.save
      redirect_to questions_path, :flash => { :success => "New faq is registered." }
    else
      render :action => :new
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    redirect_to questions_path, :flash => { :success => "A faq is deleted." }
  end

end
