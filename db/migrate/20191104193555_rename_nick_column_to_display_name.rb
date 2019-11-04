class RenameNickColumnToDisplayName < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :nick, :display_name
  end
end
