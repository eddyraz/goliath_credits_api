defmodule GoliathCredits.APITest do
  use GoliathCredits.DataCase

  alias GoliathCredits.API

  describe "quota" do
    alias GoliathCredits.API.Quota

    import GoliathCredits.APIFixtures

    @invalid_attrs %{INTE_adjust: nil, balance_sub_code: nil, bill_number: nil, delayed_quota_history_days: nil, due_date: nil, loan_code: nil, payment_date: nil, plan_number: nil, previous_payment_date: nil, previous_quota_state: nil, previous_state_sub_code: nil, prevision_amount: nil, quota_delayed_days: nil, quota_sec: nil, quota_state: nil, start_date: nil}

    test "list_quota/0 returns all quota" do
      quota = quota_fixture()
      assert API.list_quota() == [quota]
    end

    test "get_quota!/1 returns the quota with given id" do
      quota = quota_fixture()
      assert API.get_quota!(quota.id) == quota
    end

    test "create_quota/1 with valid data creates a quota" do
      valid_attrs = %{INTE_adjust: "some INTE_adjust", balance_sub_code: "some balance_sub_code", bill_number: "some bill_number", delayed_quota_history_days: 42, due_date: ~U[2022-10-13 14:05:00Z], loan_code: "some loan_code", payment_date: ~U[2022-10-13 14:05:00Z], plan_number: 42, previous_payment_date: ~U[2022-10-13 14:05:00Z], previous_quota_state: "some previous_quota_state", previous_state_sub_code: "some previous_state_sub_code", prevision_amount: "120.5", quota_delayed_days: 42, quota_sec: 42, quota_state: "some quota_state", start_date: ~U[2022-10-13 14:05:00Z]}

      assert {:ok, %Quota{} = quota} = API.create_quota(valid_attrs)
      assert quota.INTE_adjust == "some INTE_adjust"
      assert quota.balance_sub_code == "some balance_sub_code"
      assert quota.bill_number == "some bill_number"
      assert quota.delayed_quota_history_days == 42
      assert quota.due_date == ~U[2022-10-13 14:05:00Z]
      assert quota.loan_code == "some loan_code"
      assert quota.payment_date == ~U[2022-10-13 14:05:00Z]
      assert quota.plan_number == 42
      assert quota.previous_payment_date == ~U[2022-10-13 14:05:00Z]
      assert quota.previous_quota_state == "some previous_quota_state"
      assert quota.previous_state_sub_code == "some previous_state_sub_code"
      assert quota.prevision_amount == Decimal.new("120.5")
      assert quota.quota_delayed_days == 42
      assert quota.quota_sec == 42
      assert quota.quota_state == "some quota_state"
      assert quota.start_date == ~U[2022-10-13 14:05:00Z]
    end

    test "create_quota/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = API.create_quota(@invalid_attrs)
    end

    test "update_quota/2 with valid data updates the quota" do
      quota = quota_fixture()
      update_attrs = %{INTE_adjust: "some updated INTE_adjust", balance_sub_code: "some updated balance_sub_code", bill_number: "some updated bill_number", delayed_quota_history_days: 43, due_date: ~U[2022-10-14 14:05:00Z], loan_code: "some updated loan_code", payment_date: ~U[2022-10-14 14:05:00Z], plan_number: 43, previous_payment_date: ~U[2022-10-14 14:05:00Z], previous_quota_state: "some updated previous_quota_state", previous_state_sub_code: "some updated previous_state_sub_code", prevision_amount: "456.7", quota_delayed_days: 43, quota_sec: 43, quota_state: "some updated quota_state", start_date: ~U[2022-10-14 14:05:00Z]}

      assert {:ok, %Quota{} = quota} = API.update_quota(quota, update_attrs)
      assert quota.INTE_adjust == "some updated INTE_adjust"
      assert quota.balance_sub_code == "some updated balance_sub_code"
      assert quota.bill_number == "some updated bill_number"
      assert quota.delayed_quota_history_days == 43
      assert quota.due_date == ~U[2022-10-14 14:05:00Z]
      assert quota.loan_code == "some updated loan_code"
      assert quota.payment_date == ~U[2022-10-14 14:05:00Z]
      assert quota.plan_number == 43
      assert quota.previous_payment_date == ~U[2022-10-14 14:05:00Z]
      assert quota.previous_quota_state == "some updated previous_quota_state"
      assert quota.previous_state_sub_code == "some updated previous_state_sub_code"
      assert quota.prevision_amount == Decimal.new("456.7")
      assert quota.quota_delayed_days == 43
      assert quota.quota_sec == 43
      assert quota.quota_state == "some updated quota_state"
      assert quota.start_date == ~U[2022-10-14 14:05:00Z]
    end

    test "update_quota/2 with invalid data returns error changeset" do
      quota = quota_fixture()
      assert {:error, %Ecto.Changeset{}} = API.update_quota(quota, @invalid_attrs)
      assert quota == API.get_quota!(quota.id)
    end

    test "delete_quota/1 deletes the quota" do
      quota = quota_fixture()
      assert {:ok, %Quota{}} = API.delete_quota(quota)
      assert_raise Ecto.NoResultsError, fn -> API.get_quota!(quota.id) end
    end

    test "change_quota/1 returns a quota changeset" do
      quota = quota_fixture()
      assert %Ecto.Changeset{} = API.change_quota(quota)
    end
  end

  describe "clients_quota" do
    alias GoliathCredits.API.ClientsQuota

    import GoliathCredits.APIFixtures

    @invalid_attrs %{calc_number_days: nil, concept_state: nil, condoned_amount: nil, conpcept_code: nil, debt_balance: nil, earned_amount: nil, last_payment_penalty: nil, loan_code: nil, office_code: nil, paid_amount: nil, payment_date: nil, payment_sec: nil, plan_number: nil, previous_concept_state: nil, previous_earned_amount: nil, previous_paid_amount: nil, previous_payment_date: nil, previous_sec_payment: nil, quota_amount: nil, quota_sec: nil, user_code: nil}

    test "list_clients_quota/0 returns all clients_quota" do
      clients_quota = clients_quota_fixture()
      assert API.list_clients_quota() == [clients_quota]
    end

    test "get_clients_quota!/1 returns the clients_quota with given id" do
      clients_quota = clients_quota_fixture()
      assert API.get_clients_quota!(clients_quota.id) == clients_quota
    end

    test "create_clients_quota/1 with valid data creates a clients_quota" do
      valid_attrs = %{calc_number_days: 42, concept_state: "some concept_state", condoned_amount: "120.5", conpcept_code: "some conpcept_code", debt_balance: "120.5", earned_amount: "120.5", last_payment_penalty: "some last_payment_penalty", loan_code: "some loan_code", office_code: "some office_code", paid_amount: "120.5", payment_date: ~U[2022-10-13 14:05:00Z], payment_sec: 42, plan_number: 42, previous_concept_state: "some previous_concept_state", previous_earned_amount: "120.5", previous_paid_amount: "120.5", previous_payment_date: ~U[2022-10-13 14:05:00Z], previous_sec_payment: 42, quota_amount: "120.5", quota_sec: 42, user_code: "some user_code"}

      assert {:ok, %ClientsQuota{} = clients_quota} = API.create_clients_quota(valid_attrs)
      assert clients_quota.calc_number_days == 42
      assert clients_quota.concept_state == "some concept_state"
      assert clients_quota.condoned_amount == Decimal.new("120.5")
      assert clients_quota.conpcept_code == "some conpcept_code"
      assert clients_quota.debt_balance == Decimal.new("120.5")
      assert clients_quota.earned_amount == Decimal.new("120.5")
      assert clients_quota.last_payment_penalty == "some last_payment_penalty"
      assert clients_quota.loan_code == "some loan_code"
      assert clients_quota.office_code == "some office_code"
      assert clients_quota.paid_amount == Decimal.new("120.5")
      assert clients_quota.payment_date == ~U[2022-10-13 14:05:00Z]
      assert clients_quota.payment_sec == 42
      assert clients_quota.plan_number == 42
      assert clients_quota.previous_concept_state == "some previous_concept_state"
      assert clients_quota.previous_earned_amount == Decimal.new("120.5")
      assert clients_quota.previous_paid_amount == Decimal.new("120.5")
      assert clients_quota.previous_payment_date == ~U[2022-10-13 14:05:00Z]
      assert clients_quota.previous_sec_payment == 42
      assert clients_quota.quota_amount == Decimal.new("120.5")
      assert clients_quota.quota_sec == 42
      assert clients_quota.user_code == "some user_code"
    end

    test "create_clients_quota/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = API.create_clients_quota(@invalid_attrs)
    end

    test "update_clients_quota/2 with valid data updates the clients_quota" do
      clients_quota = clients_quota_fixture()
      update_attrs = %{calc_number_days: 43, concept_state: "some updated concept_state", condoned_amount: "456.7", conpcept_code: "some updated conpcept_code", debt_balance: "456.7", earned_amount: "456.7", last_payment_penalty: "some updated last_payment_penalty", loan_code: "some updated loan_code", office_code: "some updated office_code", paid_amount: "456.7", payment_date: ~U[2022-10-14 14:05:00Z], payment_sec: 43, plan_number: 43, previous_concept_state: "some updated previous_concept_state", previous_earned_amount: "456.7", previous_paid_amount: "456.7", previous_payment_date: ~U[2022-10-14 14:05:00Z], previous_sec_payment: 43, quota_amount: "456.7", quota_sec: 43, user_code: "some updated user_code"}

      assert {:ok, %ClientsQuota{} = clients_quota} = API.update_clients_quota(clients_quota, update_attrs)
      assert clients_quota.calc_number_days == 43
      assert clients_quota.concept_state == "some updated concept_state"
      assert clients_quota.condoned_amount == Decimal.new("456.7")
      assert clients_quota.conpcept_code == "some updated conpcept_code"
      assert clients_quota.debt_balance == Decimal.new("456.7")
      assert clients_quota.earned_amount == Decimal.new("456.7")
      assert clients_quota.last_payment_penalty == "some updated last_payment_penalty"
      assert clients_quota.loan_code == "some updated loan_code"
      assert clients_quota.office_code == "some updated office_code"
      assert clients_quota.paid_amount == Decimal.new("456.7")
      assert clients_quota.payment_date == ~U[2022-10-14 14:05:00Z]
      assert clients_quota.payment_sec == 43
      assert clients_quota.plan_number == 43
      assert clients_quota.previous_concept_state == "some updated previous_concept_state"
      assert clients_quota.previous_earned_amount == Decimal.new("456.7")
      assert clients_quota.previous_paid_amount == Decimal.new("456.7")
      assert clients_quota.previous_payment_date == ~U[2022-10-14 14:05:00Z]
      assert clients_quota.previous_sec_payment == 43
      assert clients_quota.quota_amount == Decimal.new("456.7")
      assert clients_quota.quota_sec == 43
      assert clients_quota.user_code == "some updated user_code"
    end

    test "update_clients_quota/2 with invalid data returns error changeset" do
      clients_quota = clients_quota_fixture()
      assert {:error, %Ecto.Changeset{}} = API.update_clients_quota(clients_quota, @invalid_attrs)
      assert clients_quota == API.get_clients_quota!(clients_quota.id)
    end

    test "delete_clients_quota/1 deletes the clients_quota" do
      clients_quota = clients_quota_fixture()
      assert {:ok, %ClientsQuota{}} = API.delete_clients_quota(clients_quota)
      assert_raise Ecto.NoResultsError, fn -> API.get_clients_quota!(clients_quota.id) end
    end

    test "change_clients_quota/1 returns a clients_quota changeset" do
      clients_quota = clients_quota_fixture()
      assert %Ecto.Changeset{} = API.change_clients_quota(clients_quota)
    end
  end
end
