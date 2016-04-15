class AddCategoryToAgents < ActiveRecord::Migration
  def change
    add_column :agents, :category, :string
  end
end
