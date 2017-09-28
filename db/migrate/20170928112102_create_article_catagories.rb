class CreateArticleCatagories < ActiveRecord::Migration[5.0]
  def change
    create_table :article_catagories do |t|
      t.integer :article_id
      t.integer :catagory_id
    end
  end
end
