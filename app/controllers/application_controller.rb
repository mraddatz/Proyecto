class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #before_action :authenticate_user! sirve para obligar a ingresar o registrarse
end
