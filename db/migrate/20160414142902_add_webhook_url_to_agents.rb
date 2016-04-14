class AddWebhookUrlToAgents < ActiveRecord::Migration
  def change
    add_column :agents, :webhook_url, :string
  end
end
