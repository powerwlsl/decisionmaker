class CreatePros < ActiveRecord::Migration
  def change
    create_table :pros do |t|
      t.string :pro_text, :null => false
      t.string :importance, :null => false
      t.integer :issue_id , :null => false

      t.timestamps null: false
    end
  end
end
