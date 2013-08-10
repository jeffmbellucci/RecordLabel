class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, :null => :false
      t.string :password, :null => :false
      t.string :session_token
      t.string :activation_token
      t.boolean :activated

      t.timestamps
    end
  end
end
