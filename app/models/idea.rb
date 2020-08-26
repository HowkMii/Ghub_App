class Idea < ApplicationRecord
  belongs_to :user
  belongs_to :university_major
  has_many :discusses
  has_attached_file :idea_img, styles: { idea_index: "350x490>", idea_show: "325x475>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :idea_img, content_type: /\Aimage\/.*\z/
end
