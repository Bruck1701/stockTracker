class UserInv < ApplicationRecord
  belongs_to :user
  belongs_to :investment

end
