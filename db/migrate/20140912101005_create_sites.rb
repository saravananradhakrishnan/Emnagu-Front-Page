class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :name
      t.integer :user_id
      #t.integer :theme_id
      t.integer :category_id

      t.timestamps
    end
  end
end
