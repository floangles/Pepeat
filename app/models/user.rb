# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  firstname              :string
#  lastname               :string
#  birthdate              :date
#  phonenumber            :string
#  sex                    :string
#  address                :string
#  city                   :string
#  pseudo                 :string
#  pepeato                :boolean
#  description            :text
#  delay                  :string
#  picture_file_name      :string
#  picture_content_type   :string
#  picture_file_size      :integer
#  picture_updated_at     :datetime
#  latitude               :float
#  longitude              :float
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :recipes, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :pepeatobookings, source: :bookings
  has_many :offers, through: :recipes

  validates :email, presence: true, uniqueness: true
  validates :firstname, presence: true, on: :update
  validates :lastname, presence: true, on: :update
  validates :phonenumber, presence: true, uniqueness: true, on: :update
  validates :address, presence: true, on: :update
  validates :city, presence: true, on: :update


  # validates :street_number, presence: true, on: :update
  # validates :route, presence: true, on: :update
  # validates :locality, presence: true, on: :update
  # validates :country, presence: true, on: :update





  has_attached_file :picture,
    styles: { medium: "300x300>", thumb: "100x100>" }, :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

end
