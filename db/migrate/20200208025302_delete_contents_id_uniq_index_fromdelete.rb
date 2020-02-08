class DeleteContentsIdUniqIndexFromdelete < ActiveRecord::Migration[5.2]
  def change
    remove_index :contents, :title
  end
end
