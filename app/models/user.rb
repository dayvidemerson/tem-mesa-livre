class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :secure_validatable, :confirmable

  enum kind: {admin: 1 , human_resources: 2, professional: 3}

  validates :username, uniqueness: true

  validates :username, :name, :document_number, :kind, presence: true

  validates :identity, :phone, presence: true, if: :professional?

  validates :identity, :phone, absence: true, unless: :professional?
end
