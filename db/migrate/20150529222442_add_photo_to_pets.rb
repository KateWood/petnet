class AddPhotoToPets < ActiveRecord::Migration
  def change
    add_column :pets, :photo, :string
  end
end
