require 'digest/sha1'

class User < ActiveRecord::Base
  set_table_name 'users'
  has_many :transactions
  has_many :accounts
  validates :login, :presence   => true,
                    :uniqueness => true,
                    :length     => { :within => 3..40 }

  validates :name,  :length     => { :maximum => 100 },
                    :allow_nil  => true

  validates :email, :presence   => true,
                    :uniqueness => true,
                    :length     => { :within => 6..100 }

  

  # HACK HACK HACK -- how to do attr_accessible from here?
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  attr_accessible :login, :email, :name, :password, :password_confirmation

  def login=(value)
    write_attribute :login, (value ? value.downcase : nil)
  end

  def email=(value)
    write_attribute :email, (value ? value.downcase : nil)
  end

  protected
end
