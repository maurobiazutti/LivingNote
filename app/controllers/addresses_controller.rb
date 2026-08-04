class AddressesController < ApplicationController
  before_action :set_profile

  def show
    @address = @profile.address || @profile.build_address
  end

  def create
    @address = @profile.build_address(address_params)

    if @address.save
      redirect_to profile_address_path, notice: "Endereço cadastrado com sucesso."
    else
      render :show, status: :unprocessable_entity
    end
  end

  def update
    @address = @profile.address

    if @address.update(address_params)
      redirect_to profile_address_path, notice: "Endereço atualizado com sucesso."
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def set_profile
    @profile = current_user.profile
    redirect_to new_profile_path, alert: "Complete seu perfil primeiro." unless @profile
  end

  def address_params
    params.require(:address).permit(:street, :number, :district, :city, :state, :zip_code, :country)
  end
end
