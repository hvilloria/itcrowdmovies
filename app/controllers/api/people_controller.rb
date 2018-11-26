class Api::PeopleController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update]
  def index
    render json: Person.all
  end

  def create
    person = Person.new(person_params)
    return render json: person if person.save
    render json: person.errors
  end

  def update
    person = Person.find(params[:id])
    return render json: person if person.update(person_params)
    render json: person.errors
  end

  private

  def person_params
    params.require(:person).permit(
      :first_name,
      :last_name,
      roles_attributes: [:id, :role_type, :movie_id]
    )
  end
end
