class User < ActiveRecord::Base
	has_many :microposts  #cada user puede (potencial) tener más de un micropost
end
