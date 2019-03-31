class CreateRiddles < ActiveRecord::Migration[5.1]
  def change
    create_table :riddles do |t|
      t.text :body
      t.text :answer
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
