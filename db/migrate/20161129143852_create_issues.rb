class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :issue_name
      t.decimal :pros_percentage, default: 0.0
      t.decimal :cons_percentage, default: 0.0
      t.string :result

      t.timestamps null: false
    end
  end
end
