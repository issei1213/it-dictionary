class RemoveUserIdIdToContents < ActiveRecord::Migration[5.2]
  def change
    remove_column :contents, :user_id_id
  end
end
