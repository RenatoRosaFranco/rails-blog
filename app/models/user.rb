# frozen_string_literal: true

class User < ApplicationRecord
  self.table_name  = 'users'
  self.primary_key = 'id'

  has_one_attached :avatar, :dependent => :destroy

  def give_admin_access
    self.admin = true
    save!
  end

  def revoke_admin_access
    self.admin = false
    save!
  end

  has_many :categories, :dependent => :destroy
  has_many :posts, :dependent => :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
end
