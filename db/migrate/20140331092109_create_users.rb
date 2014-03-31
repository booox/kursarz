class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.string :login, null: false
      t.string :name
      t.string :avatar_url

      t.timestamps
    end
  end
end
