class Admins::UsersController < Admins::ApplicationController
    def index
        @users = User.all
    end
end