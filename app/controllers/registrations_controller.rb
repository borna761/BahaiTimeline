class RegistrationsController < Devise::RegistrationsController
  def new
    flash[:notice] = 'Registrations are not currently open.'
    redirect_to root_path
  end

  def create
    flash[:notice] = 'Registrations are not currently open.'
    redirect_to root_path
  end
end
