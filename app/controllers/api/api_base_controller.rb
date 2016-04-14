class Api::ApiBaseController < ApplicationController
  skip_before_filter :verify_authenticity_token
  respond_to :json, :xml

=begin
  def user_authorized?(required_user_id)
    if current_resource_owner.nil?
      return false
    end

    accounts = current_resource_owner.user.impersonate_permission.first
    if accounts.present?
      return accounts.keys.include?(required_user_id.to_i)
    else
      return current_resource_owner.user.id == required_user_id.to_i
    end
  end
=end

  def current_resource_owner
    if doorkeeper_token
      Agent.find(doorkeeper_token.resource_owner_id)
    end

  end

=begin
  def current_resource_owner_renter
    if doorkeeper_token
      Prospect.find(doorkeeper_token.resource_owner_id)
    end
  end
=end

  def current_agent
    @agent = current_resource_owner
    respond_with @agent
  end

end
