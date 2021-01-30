class ChangeStatusToInfections < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:infections, :status, "active")
  end
end
