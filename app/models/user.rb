# frozen_string_literal: true

# devise user
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :valera_param, dependent: :destroy
  alias_method :my_valera, :valera_param

  def my_valera
    self.valera_param = ValeraParam.create(:user => self) unless self.valera_param.nil?
    self.valera_param
  end
end
