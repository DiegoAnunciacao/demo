class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :galleries
  has_many :products

  def is_admin?
    !!self.is_admin
  end

  def after_sign_in_path_for(current_user)
    if current_user.is_admin?
      admin_root_path
    else
      super
    end
  end
end
