class AddPasswordToBarister < ActiveRecord::Migration[7.0]
  def change
    add_column :baristers, :password, :string
  end
end
