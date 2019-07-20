# frozen_string_literal: true

class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, :use => :slugged

  self.table_name  = 'posts'
  self.primary_key = 'id'

  has_one_attached :thubmnail, :dependent => :destroy

  scope :by_title,    -> (title) {where('title like ?', title) }
  scope :published,   -> { where(published: true) }
  scope :unpublished, -> { where(published: false) }
  scope :by_category, -> (category) { where(category: category) }
  scope :by_user,     -> (user) { where(user: user) }
  scope :recents,     -> { order(created_at: :desc) }
  scope :lasts,       -> { order(created_at: :asc) }
  scope :related,     -> (post) { where(category: post.category) }

  belongs_to :category
  belongs_to :user

  def self.build_year_cloud
    @years ||= []
    Post.all.each do |post|
        year = post.created_at.year
        next if @years.include?(year)
        @years << year
    end
    @years
  end

  def self.build_tag_cloud
    @tags ||= []
    Post.all.each do |post|
      post.tags.split(/\s/).each do |tag|
        next if @tags.include?(tag)
        @tags << tag
      end
    end
    @tags
  end
end
