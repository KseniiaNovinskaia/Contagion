class CreateInfections < ActiveRecord::Migration[6.0]
  def change
    create_table :infections do |t|
      t.date :infection_start
      t.date :infection_end
      t.string :status
      t.references :user, null: false, foreign_key: true
      t.references :organism, null: false, foreign_key: true

      t.timestamps
    end
  end
end
