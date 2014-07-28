class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable

  validates_presence_of     :login, :email
  validates_uniqueness_of   :login,     :case_sensitive => false, :allow_blank => true, :if => :login_changed?
  validates_format_of       :email, :with  => Devise.email_regexp, :allow_blank => true, :if => :email_changed?
  validates_presence_of     :password, if: :password_required?
  validates_confirmation_of :password, if: :password_required?
  validates_length_of       :password, :within => Devise.password_length, :allow_blank => true
  validates_presence_of     :role, :on=>:create

  enum role: [:guest, :admin]

  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :guest
  end

  def password_required?
    persisted? && reset_password_token.present?
  end
end
