class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 has_one :account,dependent: :destroy
 accepts_nested_attributes_for :account
 has_many :addresses,dependent: :destroy
 has_many :pays,dependent: :destroy
 has_many :comments,dependent: :destroy
 has_many :orders
 has_many :items,dependent: :destroy

 validates :nickname, presence: true, uniqueness: true
 validates :birth_date, presence: true
 validates :first_name, presence: true
 validates :first_name_hira, presence: true
 validates :last_name, presence: true
 validates :last_name_hira, presence: true
 devise :validatable, password_length: 7..128
 VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
 validates :email, {presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }}
# VALID_EMAIL_REGEXで、ドメインを定義。メールアドレスは@とドメインを含む必要があるので下でvalidatesしています
end
