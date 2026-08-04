class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [ :show, :edit, :update, :destroy ]

  def show
    unless @profile
      redirect_to new_profile_path, alert: "Complete seu perfil primeiro."
    end
  end

  def new
    @profile = current_user.build_profile
  end

  def create
    @profile = current_user.build_profile(profile_params)

    if @profile.save
      redirect_to profile_path, notice: "Perfil criado com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path, notice: "Perfil atualizado com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @profile.destroy!
    redirect_to root_path, notice: "Perfil excluído com sucesso.", status: :see_other
  end

  private

  def set_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(
      :full_name,
      :username,
      :cpf,
      :phone,
      :bio,
      social_links_attributes: [ :id, :platform, :url, :_destroy ]
    )
  end
end
