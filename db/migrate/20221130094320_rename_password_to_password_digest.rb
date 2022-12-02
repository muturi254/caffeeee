class RenamePasswordToPasswordDigest < ActiveRecord::Migration[7.0]
  def change
    rename_column :baristers, :password, :password_digest
  end
end
