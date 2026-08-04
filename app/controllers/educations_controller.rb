class EducationsController < ApplicationController
  before_action :set_profile
  before_action :set_education, only: [ :edit, :update, :destroy ]

  def index
    @educations = @profile.educations.order(:start_date)
  end

  def new
    @education = @profile.educations.build
  end

  def create
    @education = @profile.educations.build(education_params)

    if @education.save
      redirect_to profile_educations_path, notice: "Formação acadêmica adicionada com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @education.update(education_params)
      redirect_to profile_educations_path, notice: "Formação acadêmica atualizada com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @education.destroy!
    redirect_to profile_educations_path, notice: "Formação acadêmica excluída com sucesso.", status: :see_other
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
