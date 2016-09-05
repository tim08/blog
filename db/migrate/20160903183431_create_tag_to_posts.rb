class CreateTagToPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :tag_to_posts do |t|
      t.belongs_to :tag, foreign_key: true
      t.belongs_to :post, foreign_key: true

      t.timestamps
    end
  end
end
