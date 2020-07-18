class AddStudentToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :student, :boolean, default: false
  end
end
