class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reservations, dependent: :destroy
  
  #通報機能
  has_many :reports, class_name: "Report", foreign_key: "reporter_id", dependent: :destroy
  has_many :reverse_of_reports, class_name: "Report", foreign_key: "reported_id", dependent: :destroy


  validates :last_name,
            :first_name,
            :last_name_kana,
            :first_name_kana,
            :address,
  presence: true

  # 電話番号(ハイフンなし10桁or11桁)
  validates :phone_number, format: { with: /\A\d{10,11}\z/ }

  # 郵便番号（ハイフンなし7桁）
  validates :post_code, format: { with: /\A\d{7}\z/ }

  # 会員の名前の結合
  def full_name
     self.last_name + " " + self.first_name
  end

  def full_name_kana
    self.last_name_kana + " " + self.first_name_kana
  end

  def customer_status
    if is_valid
      "有効"
    else
      "退会"
    end
  end

  #ゲストログイン
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |customer|
      customer.last_name = SecureRandom.urlsafe_base64
      customer.first_name = SecureRandom.urlsafe_base64
      customer.last_name_kana = SecureRandom.urlsafe_base64
      customer.first_name_kana = SecureRandom.urlsafe_base64
      customer.phone_number = "0000000000"
      customer.post_code = "0000000"
      customer.address = SecureRandom.urlsafe_base64
      customer.password = SecureRandom.urlsafe_base64
    end
  end
end
