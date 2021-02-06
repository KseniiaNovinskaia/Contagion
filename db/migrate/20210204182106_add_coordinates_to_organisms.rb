class AddCoordinatesToOrganisms < ActiveRecord::Migration[6.0]
  def change
    add_column :organisms, :latitude, :float
    add_column :organisms, :longitude, :float
  end
end
