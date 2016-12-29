class AddBookFieldsToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :title, :string, :limit => 32
    add_column :books, :subject_id, :integer
    add_column :books, :description, :text
  end
end
