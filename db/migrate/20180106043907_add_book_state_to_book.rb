class AddBookStateToBook < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :book_state, :string
  end
end
