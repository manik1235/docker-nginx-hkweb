class RemoveGroupColumnOnLandings < ActiveRecord::Migration[5.2]
  def change
    remove_column :landings, :group, :string
    add_reference :landings, :group
  end
end
