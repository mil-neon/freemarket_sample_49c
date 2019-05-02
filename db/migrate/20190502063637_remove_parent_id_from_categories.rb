class RemoveParentIdFromCategories < ActiveRecord::Migration[5.2]
  def change
    remove_reference :categories, :parent
  end
end
