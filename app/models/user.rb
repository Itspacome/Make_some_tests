class User < ApplicationRecord

	validates :first_name, presence: true, uniqueness: {case_sensitive: false}, format: {with: /\A[a-zA-Z0-9 _\.]*\z/}
	validates :last_name, presence: true, uniqueness: {case_sensitive: false}, format: {with: /\A[a-zA-Z0-9 _\.]*\z/}
	validates :email, presence: true, uniqueness: true

  devise :database_authenticatable, :registerable,
		 :recoverable, :rememberable, :trackable, :validatable

end
