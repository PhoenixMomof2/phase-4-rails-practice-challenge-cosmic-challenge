class MissionsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessible_entity_response
  def create
    mission = Mission.create!(mission_params)
    render json: mission.planet, status: :created
  end

  private
  def mission_params
    params.permit(:name, :scientist_id, :planet_id)
  end

  def render_unprocessible_entity_response(exception)
    render json: { "errors": exception.record.errors.full_messages }, status: :unprocessible_entity
  end
end
