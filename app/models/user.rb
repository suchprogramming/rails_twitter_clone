class User < ActiveRecord::Base
  has_many :tweets, dependent: :destroy

  before_create :twitterize_handle
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  private
  def twitterize_handle
    handle.prepend("@")
  end
end
