class AddAddressToOrganims < ActiveRecord::Migration[6.0]
  def change
    add_column :organisms, :address, :string
  end
end
