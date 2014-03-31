class AddMissingAttributesToUser < ActiveRecord::Migration
  def change
    add_column :users, :uid, :string
    add_column :users, :provider, :string
    add_column :users, :description, :string
    add_column :users, :website, :string
    add_column :users, :location, :string
  end
end
