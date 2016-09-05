class Post < ApplicationRecord

  belongs_to :user
  has_many :tag_to_posts
  has_many :tags, :through => :tag_to_posts
  has_many :comments, :dependent => :destroy

  validates :body, :title, :presence => true

  default_scope { order(created_at: :desc) }
  scope :published, -> { where(active: true) }


  self.per_page = 5

  def tags_str=(names)
    previous_tags = tags.map(&:name)
    new_tags = names.split(',')
    if previous_tags.sort != new_tags.sort
      self.tags = names.split(',').map { |name| Tag.where(name: name.strip).first_or_create! }
      # Удаляем неиспользуемые теги
      #TODO move it to jobs
      Tag.left_outer_joins(:posts).where(posts: { id: nil }).destroy_all if previous_tags.present?
    end
  end

  def tags_str
    self.tags.map(&:name).join(', ')
  end

  def self.by_tag(name)
    Tag.find_by_name!(name).posts
  end


end
