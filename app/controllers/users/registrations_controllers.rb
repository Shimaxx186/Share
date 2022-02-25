class Users::RegistrationsController < Devise::RegistrationsController
  before_action :guest_user, only: %i[update destroy]
end