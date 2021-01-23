class CreateOrganisms < ActiveRecord::Migration[6.0]
  def change
    create_table :organisms do |t|
      t.string :name
      t.integer :body_temperature
      t.integer :age
      t.string :species
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
