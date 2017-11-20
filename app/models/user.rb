class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  after_initialize :set_defaults, unless: :persisted?
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, omniauth_providers: [:facebook]
  has_many :destinations
  has_many :reviews
  mount_uploader :photo, PhotoUploader


  def set_defaults
    self.years  ||= 0
    self.number_countries ||= 0
  end
end
