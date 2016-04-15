class Api::HooksController < Api::ApiBaseController
  before_action :doorkeeper_authorize!

  def index
    agent = current_resource_owner
    @checkins = {:id => 1, :title => "blah", :description => "blah"}
    respond_with @checkins
  end

  def create
    agent = current_resource_owner
    agent.webhook_url = params[:target_url]
    agent.save
    render json: {id: agent.id}, status: 201
  end

  def destroy
    agent = current_resource_owner
    if agent.id == params[:id]
      agent.webhook_url = nil
      agent.save
      render :nothing => true
    else
      head :unauthorized
    end

  end
end
