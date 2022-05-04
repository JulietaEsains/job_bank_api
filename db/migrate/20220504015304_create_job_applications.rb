class CreateJobApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :job_applications do |t|
      t.integer :status, default: 0
      t.text :message
      #t.references :job_offer, null: false, foreign_key: true
      t.belongs_to :job_offer
      #t.references :candidate, null: false, foreign_key: true
      t.belongs_to :candidate

      t.timestamps
    end
  end
end
