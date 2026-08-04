class CertificationsController < ApplicationController
  before_action :set_profile
  before_action :set_certification, only: [ :edit, :update, :destroy ]

  def new
    @certification = @profile.certifications.build
  end

  def create
    @certification = @profile.certifications.build(certification_params)

    if @certification.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to profile_educations_path, notice: "Certificação adicionada com sucesso." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @certification.update(certification_params)
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to profile_educations_path, notice: "Certificação atualizada com sucesso." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @certification.destroy!
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to profile_educations_path, notice: "Certificação excluída com sucesso.", status: :see_other }
    end
  end

  private

  def set_profile
    @profile = current_user.profile
    redirect_to new_profile_path, alert: "Complete seu perfil primeiro." unless @profile
  end

  def set_certification
    @certification = @profile.certifications.find(params[:id])
  end

  def certification_params
    params.require(:certification).permit(:name, :issuer, :issue_date)
  end
end
