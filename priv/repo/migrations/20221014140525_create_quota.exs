defmodule GoliathCredits.Repo.Migrations.CreateQuota do
  use Ecto.Migration

  def change do
      create table(:quota) do
      add(:loan_code, :string, size: 19, null: false, primary_key: true)
      add(:plan_number, :integer, null: false, default: 0, primary_key: true)
      add(:quota_sec, :integer, null: false, default: 0, primary_key: true)
      add(:start_date, :utc_datetime, null: false)
      add(:due_date, :utc_datetime, null: false)
      add(:payment_date, :utc_datetime, null: true)
      add(:quota_delayed_days, :integer, null: false, default: 0)
      add(:quota_state, :string, size: 10, null: false)
      add(:balance_sub_code, :string, size: 15, null: false)
      add(:delayed_quota_history_days, :integer, null: false)
      add(:previous_quota_state, :string, size: 10, null: true)
      add(:previous_payment_date, :utc_datetime, null: true)
      add(:previous_state_sub_code, :string, size: 7, null: false)
      add(:prevision_amount, :decimal, default: 0.00, null: false)
      add(:inte_adjust, :binary, null: false)
      add(:bill_number, :string, size: 1, null: false)
        
    end
  end
end
