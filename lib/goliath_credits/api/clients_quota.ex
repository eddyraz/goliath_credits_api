defmodule GoliathCredits.API.ClientsQuota do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:id,
				 :loan_code,
				 :calc_number_days,
				 :concept_state,
				 :condoned_amount,
				 :office_code,
				 :concept_code,
                                 :debt_balance,
                                 :earned_amount,
                                 :last_payment_penalty,
                                 :paid_amount,
                                 :payment_date,
                                 :payment_sec,
                                 :plan_number,
                                 :previous_concept_state,
                                 :previous_earned_amount,
                                 :previous_paid_amount,
                                 :previous_payment_date,
                                 :previous_sec_payment,
                                 :quota_amount,
                                 :quota_sec,
                                 :user_code]}


  schema "clients_quota" do
    field :calc_number_days, :integer
    field :concept_state, :string
    field :condoned_amount, :decimal
    field :concept_code, :string
    field :debt_balance, :decimal
    field :earned_amount, :decimal
    field :last_payment_penalty, :binary
    field :loan_code, :string
    field :office_code, :string
    field :paid_amount, :decimal
    field :payment_date, :utc_datetime
    field :payment_sec, :integer
    field :plan_number, :integer
    field :previous_concept_state, :string
    field :previous_earned_amount, :decimal
    field :previous_paid_amount, :decimal
    field :previous_payment_date, :utc_datetime
    field :previous_sec_payment, :integer
    field :quota_amount, :decimal
    field :quota_sec, :integer
    field :user_code, :string


  end

  @doc false
  def changeset(clients_quota, attrs) do
    clients_quota
    |> cast(attrs, [:loan_code, :plan_number, :quota_sec, :concept_code, :user_code, :calc_number_days, :quota_amount, :earned_amount, :paid_amount, :condoned_amount, :payment_sec, :payment_date, :concept_state, :previous_paid_amount, :previous_concept_state, :previous_payment_date, :previous_sec_payment, :last_payment_penalty, :previous_earned_amount, :debt_balance, :office_code])
    |> validate_required([:loan_code, :plan_number, :quota_sec, :concept_code, :user_code, :calc_number_days, :quota_amount, :earned_amount, :paid_amount, :condoned_amount, :payment_sec, :payment_date, :concept_state, :previous_paid_amount, :previous_concept_state, :previous_payment_date, :previous_sec_payment, :last_payment_penalty, :previous_earned_amount, :debt_balance, :office_code])
  end
end
