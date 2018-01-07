class CreateBorrows < ActiveRecord::Migration[5.1]
  def change
    create_table :borrows do |t|

      t.timestamps
    end
  end
end
