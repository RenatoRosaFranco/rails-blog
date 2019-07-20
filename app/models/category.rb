# frozen_string_literal: true

class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, :use => :slugged

  self.table_name  = 'categories'
  self.primary_key = 'id'

  has_many :posts, :dependent => :destroy
  belongs_to :category, optional: true
  belongs_to :user
end
