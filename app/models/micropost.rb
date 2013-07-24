class Micropost < ActiveRecord::Base
validates :content, :length => { :maximum => 140 } #impedimos que el contenido del micropost supere los 140 caracteres
belongs_to :user   #cada micropost debe de tener un user
end
