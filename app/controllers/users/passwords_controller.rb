class Users::PasswordsController < Devise::PasswordsController
  before_action :guest_user, only: :create
end