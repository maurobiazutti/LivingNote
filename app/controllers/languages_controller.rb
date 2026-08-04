class LanguagesController < ApplicationController
  before_action :set_profile
  before_action :set_language, only: [ :edit, :update, :destroy ]

  def new
    @language = @profile.languages.build
  end

  def create
    @language = @profile.languages.build(language_params)

    if @language.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to profile_educations_path, notice: "Idioma adicionado com sucesso." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @language.update(language_params)
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to profile_educations_path, notice: "Idioma atualizado com sucesso." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @language.destroy!
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to profile_educations_path, notice: "Idioma excluído com sucesso.", status: :see_other }
    end
  end

  private

  def set_profile
    @profile = current_user.profile
    redirect_to new_profile_path, alert: "Complete seu perfil primeiro." unless @profile
  end

  def set_language
    @language = @profile.languages.find(params[:id])
  end

  def language_params
    params.require(:language).permit(:name, :level)
  end
end
