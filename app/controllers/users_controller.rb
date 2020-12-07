class UsersController < ApplicationController
  def index
    matching_users = User.all

    @list_of_users = matching_users.order({ :first_name => :asc })

    render({ :template => "users/index.html.erb" })
  end

   def show
    the_id = params.fetch("path_id")

    matching_users = User.where({ :id => the_id })

    @the_user = matching_users.at(0)

    render({ :template => "users/show.html.erb" })
  end


end
