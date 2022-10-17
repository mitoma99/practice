class PostImage < ApplicationRecord

  has_one_attached :image
  belongs_to :user
  has_many :post_commnts, dependent: :destroy
  
  def get_image
    if image.attached?
      image
    else
      'no_iamge.jpg'
    end
  end
  
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpq')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end 
    image
  end 
end
