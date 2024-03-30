module Admin
  class UsersController < ApplicationController
    include Pagy::Backend

    def index
      @query = params[:query]
      @pagy, @users = pagy(users(@query))
    end

    private

    def users(query)
      User.search(query)
        .includes(employee: {avatar_attachment: :blob}, company: {avatar_attachment: :blob})
        .order(:email)
    end
  end
end
