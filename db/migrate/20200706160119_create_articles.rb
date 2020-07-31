class CreateArticles < ActiveRecord::Migration[6.0]

  def change
    create_table :articles do |t|
      t.string :title
      t.boolean :is_published

      t.references :user

      t.timestamps
    end
  end

end
