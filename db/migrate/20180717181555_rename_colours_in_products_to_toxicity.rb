class RenameColoursInProductsToToxicity < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :colour, :toxicity
  end
end
