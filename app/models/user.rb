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

  def except_current_user(users)
    users.reject { |user| user.id ==self.id }
  end

  def friends_with?(user)
    self.friends.where(id:user.id).exists?    
  end

  def self.search(search_term)
    search_term.strip!
    if search_term.split.count > 1
      results = matches(search_term.split.first,:first_name) & matches(search_term.split.last,:last_name)
    else
      results = (matches(search_term,:first_name) + matches(search_term,:last_name) + matches(search_term,:email)).uniq
    end
    return nil unless results
    results
  end

  def self.matches(search_term,search_field)
    field = arel_table[search_field]
    where(field.matches("%#{search_term}%"))
  end
      
end
