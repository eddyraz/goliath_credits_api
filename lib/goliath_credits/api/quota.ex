defmodule GoliathCredits.API.Quota do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:id,
				 :loan_code,
				 :inte_adjust,
				 :balance_sub_code,
				 :bill_number,
                                 :delayed_quota_history_days, 
                                 :due_date,
				 :payment_date,
				 :plan_number,
				 :previous_payment_date,
				 :previous_quota_state,
				 :previous_state_sub_code,
				 :prevision_amount,
				 :quota_delayed_days,
				 :quota_state,
				 :start_date]}
 
  schema "quota" do
    field :inte_adjust, :binary
    field :balance_sub_code, :string
    field :bill_number, :string
    field :delayed_quota_history_days, :integer
    field :due_date, :utc_datetime
    field :loan_code, :string
    field :payment_date, :utc_datetime
    field :plan_number, :integer
    field :previous_payment_date, :utc_datetime
    field :previous_quota_state, :string
    field :previous_state_sub_code, :string
    field :prevision_amount, :decimal
    field :quota_delayed_days, :integer
    field :quota_sec, :integer
    field :quota_state, :string
    field :start_date, :utc_datetime


  end

  @doc false
  def changeset(quota, attrs) do
    quota
    |> cast(attrs, [:loan_code, :plan_number, :quota_sec, :start_date, :payment_date, :due_date, :quota_delayed_days, :quota_state, :balance_sub_code, :delayed_quota_history_days, :previous_quota_state, :previous_payment_date, :previous_state_sub_code, :prevision_amount, :inte_adjust, :bill_number])
    |> validate_required([:loan_code, :plan_number, :quota_sec, :start_date, :payment_date, :due_date, :quota_delayed_days, :quota_state, :balance_sub_code, :delayed_quota_history_days, :previous_quota_state, :previous_payment_date, :previous_state_sub_code, :prevision_amount, :inte_adjust, :bill_number])
  end
end
