class Admin::ChallengesController < Admin::AdminController
  before_action :set_challenge, only: [:show, :edit, :update, :destroy]


  def index
    @challenges = Challenge.all
  end

  def show
    respond_with(@challenge)
  end

  def new
    @challenge = Challenge.new
  end

  def edit
  end

  def create
    @challenge = Challenge.new(challenge_params)
    @challenge.save
    redirect_to admin_challenges_path
  end

  def update
    @challenge.update(challenge_params)
    redirect_to admin_challenges_path
  end

  def destroy
    @challenge.destroy
    redirect_to admin_challenges_path
  end

  private
    def set_challenge
      @challenge = Challenge.find(params[:id])
    end

    def challenge_params
      params.require(:challenge).permit(:title, :start_at, :end_at, :description)
    end
end
