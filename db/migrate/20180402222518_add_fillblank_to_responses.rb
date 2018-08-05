class AddFillblankToResponses < ActiveRecord::Migration[5.1]
  def change
    add_column :responses, :fill_blank, :string
  end
end
