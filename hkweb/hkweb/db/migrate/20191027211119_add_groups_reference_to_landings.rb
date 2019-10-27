class AddGroupsReferenceToLandings < ActiveRecord::Migration[5.2]
  def change
    remove_column :group, :string
    add_reference :landings, :group_id
  end
end
