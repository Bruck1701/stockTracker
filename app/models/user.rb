class User < ApplicationRecord
  has_many :user_invs
  has_many :investments, through: :user_invs
  has_many :friendships
  has_many :friends, through: :friendships

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def can_track_new_investment?
    
    investments.count<10
  end

  def has_investment?(symbol,investment_type)
     
    investment= Investment.in_db?(symbol,investment_type)
    return false unless investment
    investments.where(id: investment.id).exists?
  end

  def full_name
    return "#{first_name} #{last_name}" if first_name || last_name 
    "Anonymous" 
  end

      
end
