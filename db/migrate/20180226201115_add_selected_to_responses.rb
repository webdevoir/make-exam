class AddSelectedToResponses < ActiveRecord::Migration[5.1]
  def change
    add_column :responses, :selected, :boolean
  end
end
