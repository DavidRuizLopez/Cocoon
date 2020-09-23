class Booking < ApplicationRecord
  serialize :dates, Array

  belongs_to :user
  belongs_to :location
  has_many :reviews, dependent: :destroy

  monetize :amount_cents

  enum status: [:pending, :comfirm, :canceled, :paid]

  validates :dates, presence: true

  after_create :create_booked_notification
  after_update :create_notification

  private

  def create_notification
    new_status = saved_changes["status"]&.last

    return unless new_status

    case new_status
    when 'comfirm' then create_confirmed_notification
    when 'canceled' then create_canceled_notification
    when 'paid' then create_paid_notification
    end
  end

  def create_booked_notification
    Notification.create(
      recipient: location.user,
      actor: user,
      action: 'booked',
      notifiable: self
    )
  end

  def create_confirmed_notification
    Notification.create(
      recipient: user,
      actor: location.user,
      action: 'accepted',
      notifiable: self
    )
  end

  def create_canceled_notification
    Notification.create(
      recipient: user,
      actor: location.user,
      action: 'canceled',
      notifiable: self
    )
  end

  def create_paid_notification
    Notification.create(
      recipient: location.user,
      actor: user,
      action: 'paid',
      notifiable: self
    )
  end
end
