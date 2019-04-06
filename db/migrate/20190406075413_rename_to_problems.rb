class RenameToProblems < ActiveRecord::Migration[5.1]
  def change
    rename_table :riddles, :problems
  end
end
