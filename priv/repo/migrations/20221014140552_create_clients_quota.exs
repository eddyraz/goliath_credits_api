defmodule GoliathCredits.Repo.Migrations.CreateClientsQuota do
  use Ecto.Migration

  def change do

     create table(:clients_quota) do
     
      add(:loan_code, :string, size: 19, null: false, primary_key: true)
      add(:plan_number, :integer, null: false, default: 0, primary_key: true)
      add(:quota_sec, :integer, null: false, default: 0, primary_key: true)
      add(:concept_code, :string, size: 5, null: false, primary_key: true)
      add(:user_code, :string, size: 15, null: false)
      add(:calc_number_days, :integer, default: 0, null: false)
      add(:quota_amount, :decimal, default: 0.00, null: false)
      add(:earned_amount, :decimal, default: 0.00, null: false)
      add(:paid_amount, :decimal, default: 0.00, null: false)
      add(:condoned_amount, :decimal, default: 0.00, null: false)
      add(:payment_sec, :integer, default: 0, null: false)
      add(:payment_date, :utc_datetime, null: true)
      add(:concept_state, :string, size: 10, null: false)
      add(:previous_paid_amount, :decimal, default: 0.00, null: true)
      add(:previous_concept_state, :string, size: 10, null: true)
      add(:previous_payment_date, :utc_datetime, null: true)
      add(:previous_sec_payment, :integer, default: 0, null: true)
      add(:last_payment_penalty, :binary, null: true)
      add(:previous_earned_amount, :decimal, default: 0.00, null: true)
      add(:debt_balance, :decimal, default: 0.00, null: false)
      add(:office_code, :string, size: 4, null: false)


    end
  end
end
