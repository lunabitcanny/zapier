class AgentsController < ApplicationController
  before_action :authenticate_agent!

  def send_zap
    url = current_agent.webhook_url
    data = [{:id => 1, :title => "blah", :description => "blah", :category => "Cat 1"}]
    response = HTTParty.post(url,
                             body: data.to_json,
                             headers: {'Content-Type' => 'application/json'})
    if !response.success?
      raise "web hook error - #{response.inspect}"
    else
      flash[:success] = "succesfully zapped"
      redirect_to agents_path
    end
  end
end
