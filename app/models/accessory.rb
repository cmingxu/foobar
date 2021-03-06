# == Schema Information
#
# Table name: accessories
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  count         :integer
#  category_id   :integer
#  category_name :string(255)
#  user_id       :integer
#  state         :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#


require 'jbuilder'
class Accessory < ApplicationRecord
  include AASM
  ES_INDEX = "foobar"
  ES_TYPE = "accessories"

  STATE_MAP = {published: "已发布", pending: "未发布", hold: "暂存" }

  STATE_MAP.keys.each do |s|
    scope s, proc { where(state: s) }
  end

  QUANTITY_LIST = {
    "cate100": "全新",
    "cate90": "九成新",
    "cate80": "八成新",
    "cate70": "五成新",
  }

  belongs_to :user
  belongs_to :category

  has_many :accessory_conditions, dependent: :destroy
  has_many :conditions, through: :accessory_conditions
  has_many :accessory_condition_values, dependent: :destroy
  has_many :condition_values, through: :accessory_condition_values
  has_many :image_assets, as: :attachable

  validates :count, presence: { message: '配件数量不能空' }
  validates :price, presence: { message: '配件单价不能空' }
  accepts_nested_attributes_for :image_assets
  after_save :es_index
  before_save :accessory_reinit
  after_destroy :remove_es_index

  aasm :state do
    state :pending, initial: true
    state :publishing
    state :hold
    state :expired

    event :publish do
      transitions from: :pending, to: :published
    end

    event :time_due do
      transitions from: [:published], to: :expired
    end

    event :hold do
      transitions from: [:pending, :published], to: :hold
    end
  end


  def title
    [self.category_name || self.category.try(:name), self.count].join " "
  end


  # elastic search related methods
  def es_index
    request = $esclient.es_request ES_INDEX, ES_TYPE, self.id, self.es_body
    $esclient.es_index request
  end

  def remove_es_index
    $esclient.es_remove ES_INDEX, ES_TYPE, self.id
  end

  class << self
    def es_query_name_like_and_condition_match(name, condition_matches)
      matches = [{
        match: {
          name: {
            "query": name,
            "fuzziness": 2
          }
        }
      }
      ]

      condition_matches.each do |k,  v|
        match = {
          match: {
            "#{k}": {
              "query": v,
              "fuzziness": 0
            }
          }
        }

        matches.push match
      end

      Jbuilder.encode do |json|
        json.query do
          json.bool do
            json.must do
              json.array! matches
            end
          end
        end
      end
    end
  end

  def es_body
    body = {
      description: self.description,
      count: self.count,
      category_name: self.category_name,
      category_pinyin: self.category.try(:pinyin),
    }
    self.conditions.each do |condition|
      body[condition.pinyin.downcase] = self.condition_values.of_condition(condition).first.try(:pinyin).try(:downcase)
      body[condition.name] = self.condition_values.of_condition(condition).first.try(:name)
    end

    body
  end

  def accessory_reinit
    self.category_name = self.category.try :name
    self.count ||= 10
  end
end
