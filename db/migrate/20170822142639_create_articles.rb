class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :name
      t.string :source
      t.string :author
      t.string :topics
      t.string :photos
      t.string :friends

      t.timestamps
    end
  end
end
