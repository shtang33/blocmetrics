class CreateRegisteredApplications < ActiveRecord::Migration
  def change
    create_table :registered_applications do |t|
      t.string :name
      t.string :url
      t.text :description
      t.references :user, index: true

      t.timestamps null: false
    end
    add_index :registered_applications, :url, unique: true
    add_foreign_key :registered_applications, :users
  end
end
