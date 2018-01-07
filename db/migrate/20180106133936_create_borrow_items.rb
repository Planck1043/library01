class CreateBorrowItems < ActiveRecord::Migration[5.1]
  def change
    create_table :borrow_items do |t|
      t.integer :borrow_id
      t.integer :book_id
      t.integer :quantity, default: 1

      t.timestamps
    end
  end
end
