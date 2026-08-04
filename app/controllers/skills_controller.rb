class SkillsController < ApplicationController
  before_action :set_profile
  before_action :set_skill, only: [ :edit, :update, :destroy ]

  def new
    @skill = @profile.skills.build
  end

  def create
    @skill = @profile.skills.build(skill_params)

    if @skill.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to profile_educations_path, notice: "Skill adicionada com sucesso." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @skill.update(skill_params)
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to profile_educations_path, notice: "Skill atualizada com sucesso." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @skill.destroy!
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to profile_educations_path, notice: "Skill excluída com sucesso.", status: :see_other }
    end
  end

  private

  def set_profile
    @profile = current_user.profile
    redirect_to new_profile_path, alert: "Complete seu perfil primeiro." unless @profile
  end

  def set_skill
    @skill = @profile.skills.find(params[:id])
  end

  def skill_params
    params.require(:skill).permit(:name, :level)
  end
end
