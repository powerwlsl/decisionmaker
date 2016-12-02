class CreateCons < ActiveRecord::Migration
  def change
    create_table :cons do |t|
      t.string :con_text, :null => false
      t.string :importance, :null => false
      t.integer :issue_id , :null => false

      t.timestamps null: false

    end
  end
end
