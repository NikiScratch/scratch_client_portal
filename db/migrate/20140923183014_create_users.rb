class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :/
      t.string :name
      t.string :provider
      t.string :uid
      t.string :role

      t.timestamps
    end
  end
end
