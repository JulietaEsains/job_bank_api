class CreateJobOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :job_offers do |t|
      t.string :title
      t.text :description
      #t.references :company, null: false, foreign_key: true
      t.belongs_to :company

      t.timestamps
    end
  end
end
