class AddPictureToProblems < ActiveRecord::Migration[5.1]
  def change
    add_column :problems, :picture, :string
  end
end
