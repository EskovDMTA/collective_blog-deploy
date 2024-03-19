# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :body
      t.references :creator, null: false, foreign_key: { to_table: :users, column: :creator_id }
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
