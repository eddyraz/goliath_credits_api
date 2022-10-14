defmodule GoliathCredits.APIFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `GoliathCredits.API` context.
  """

  @doc """
  Generate a quota.
  """
  def quota_fixture(attrs \\ %{}) do
    {:ok, quota} =
      attrs
      |> Enum.into(%{
        INTE_adjust: "some INTE_adjust",
        balance_sub_code: "some balance_sub_code",
        bill_number: "some bill_number",
        delayed_quota_history_days: 42,
        due_date: ~U[2022-10-13 14:05:00Z],
        loan_code: "some loan_code",
        payment_date: ~U[2022-10-13 14:05:00Z],
        plan_number: 42,
        previous_payment_date: ~U[2022-10-13 14:05:00Z],
        previous_quota_state: "some previous_quota_state",
        previous_state_sub_code: "some previous_state_sub_code",
        prevision_amount: "120.5",
        quota_delayed_days: 42,
        quota_sec: 42,
        quota_state: "some quota_state",
        start_date: ~U[2022-10-13 14:05:00Z]
      })
      |> GoliathCredits.API.create_quota()

    quota
  end

  @doc """
  Generate a clients_quota.
  """
  def clients_quota_fixture(attrs \\ %{}) do
    {:ok, clients_quota} =
      attrs
      |> Enum.into(%{
        calc_number_days: 42,
        concept_state: "some concept_state",
        condoned_amount: "120.5",
        conpcept_code: "some conpcept_code",
        debt_balance: "120.5",
        earned_amount: "120.5",
        last_payment_penalty: "some last_payment_penalty",
        loan_code: "some loan_code",
        office_code: "some office_code",
        paid_amount: "120.5",
        payment_date: ~U[2022-10-13 14:05:00Z],
        payment_sec: 42,
        plan_number: 42,
        previous_concept_state: "some previous_concept_state",
        previous_earned_amount: "120.5",
        previous_paid_amount: "120.5",
        previous_payment_date: ~U[2022-10-13 14:05:00Z],
        previous_sec_payment: 42,
        quota_amount: "120.5",
        quota_sec: 42,
        user_code: "some user_code"
      })
      |> GoliathCredits.API.create_clients_quota()

    clients_quota
  end
end
