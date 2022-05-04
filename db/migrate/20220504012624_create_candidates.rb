class CreateCandidates < ActiveRecord::Migration[7.0]
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :lastName
      t.integer :age
      t.string :token

      t.timestamps
    end
  end
end
