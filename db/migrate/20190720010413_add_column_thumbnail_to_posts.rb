# frozen_string_literal: true

class AddColumnThumbnailToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :thubmnail, :string
  end
end
