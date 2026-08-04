class ExperiencesController < ApplicationController
  before_action :set_profile
  before_action :set_experience, only: [ :edit, :update, :destroy ]

  def index
    @experiences = @profile.experiences.order(:start_date)
  end

  def new
    @experience = @profile.experiences.build
  end

  def create
    @experience = @profile.experiences.build(experience_params)

    if @experience.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to profile_experiences_path, notice: "Experiência profissional adicionada com sucesso." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @experience.update(experience_params)
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to profile_experiences_path, notice: "Experiência profissional atualizada com sucesso." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @experience.destroy!
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to profile_experiences_path, notice: "Experiência profissional excluída com sucesso.", status: :see_other }
    end
  end

  private

  def set_profile
    @profile = current_user.profile
    redirect_to new_profile_path, alert: "Complete seu perfil primeiro." unless @profile
  end

  def set_experience
    @experience = @profile.experiences.find(params[:id])
  end

  def experience_params
    params.require(:experience).permit(:company, :position, :description, :start_date, :end_date)
  end
end
