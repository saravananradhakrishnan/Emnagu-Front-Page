class AddFieldsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :user_name, :string
    add_column :users, :subdomain, :string
    add_column :users, :gender, :string
    add_column :users, :contact, :string
  end
end
