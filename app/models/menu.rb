class Menu < ApplicationRecord
  has_one_attached :image

  belongs_to :hotel

  has_many :reservations, dependent: :destroy
  has_many :stars, dependent: :destroy

  validates :title, presence: true, uniqueness: true

  validates :price,
            :detail,
  presence: true

  # 画像呼び出しメソッド
  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_fill: [width, height]).processed
  end

  def stered_by?(user)
    favorites.exists?(customer_id: customer.id)
  end
end
