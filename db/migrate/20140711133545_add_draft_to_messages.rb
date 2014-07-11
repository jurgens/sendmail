class AddDraftToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :draft, :boolean
  end
end
