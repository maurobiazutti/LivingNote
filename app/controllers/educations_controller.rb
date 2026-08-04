class EducationsController < ApplicationController
  before_action :set_profile
  before_action :set_education, only: [ :edit, :update, :destroy ]

  def index
    @educations = @profile.educations.order(:start_date)
    @certifications = @profile.certifications.order(:name)
    @skills = @profile.skills.order(:name)
    @languages = @profile.languages.order(:name)
  end

  def new
    @education = @profile.educations.build
  end

  def create
    @education = @profile.educations.build(education_params)

    if @education.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to profile_educations_path, notice: "Formação acadêmica adicionada com sucesso." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @education.update(education_params)
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to profile_educations_path, notice: "Formação acadêmica atualizada com sucesso." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @education.destroy!
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to profile_educations_path, notice: "Formação acadêmica excluída com sucesso.", status: :see_other }
    end
  end

  private

  def set_profile
    @profile = current_user.profile
    redirect_to new_profile_path, alert: "Complete seu perfil primeiro." unless @profile
  end

  def set_education
    @education = @profile.educations.find(params[:id])
  end

  def education_params
    params.require(:education).permit(:institution, :degree, :course, :start_date, :end_date)
  end
end
