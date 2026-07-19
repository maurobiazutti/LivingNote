class ProfilesController < ApplicationController
  def show
     @profile = current_user.profile

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
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile

    if @profile.update(profile_params)
      redirect_to profile_path, notice: "Perfil atualizado com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def profile_params
    params.require(:profile).permit(
      :full_name,
      :username,
      :cpf,
      :phone,
      :bio
    )
  end
end
