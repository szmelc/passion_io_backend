class ChangeDataTypeForState < ActiveRecord::Migration[6.0]
  def change
    change_column :categories, :state, 'integer USING CAST(state AS integer)'
    change_column :courses, :state, 'integer USING CAST(state AS integer)'
  end
end
