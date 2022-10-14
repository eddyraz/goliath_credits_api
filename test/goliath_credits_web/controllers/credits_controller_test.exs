defmodule GoliathCreditsWeb.CreditsControllerTest do
  use GoliathCreditsWeb.ConnCase

  import GoliathCredits.APIFixtures

  alias GoliathCredits.API.Credits

  @create_attrs %{
    user_code: "some user_code",
    concept_state: "some concept_state",
    previous_quota_state: "some previous_quota_state",
    calc_number_days: 42,
    prevision_amount: "120.5",
    office_code: "some office_code",
    debt_balance: "120.5",
    ClientsQuota: "some ClientsQuota",
    earned_amount: "120.5",
    INTE_adjust: "some INTE_adjust",
    clients_quota: "some clients_quota",
    plan_number: 42,
    condoned_amount: "120.5",
    previous_sec_payment: 42,
    previous_payment_date: ~U[2022-10-13 14:06:00Z],
    bill_number: "some bill_number",
    previous_paid_amount: "120.5",
    Cabbot.Creditos: "some Cabbot.Creditos",
    quota_delayed_days: 42,
    loan_code: "some loan_code",
    paid_amount: "120.5",
    previous_state_sub_code: "some previous_state_sub_code",
    quota_sec: 42,
    last_payment_penalty: "some last_payment_penalty",
    start_date: ~U[2022-10-13 14:06:00Z],
    payment_date: ~U[2022-10-13 14:06:00Z],
    quota_state: "some quota_state",
    previous_concept_state: "some previous_concept_state",
    payment_sec: 42,
    due_date: ~U[2022-10-13 14:06:00Z],
    quota_amount: "120.5",
    delayed_quota_history_days: 42,
    previous_earned_amount: "120.5",
    conpcept_code: "some conpcept_code",
    balance_sub_code: "some balance_sub_code"
  }
  @update_attrs %{
    user_code: "some updated user_code",
    concept_state: "some updated concept_state",
    previous_quota_state: "some updated previous_quota_state",
    calc_number_days: 43,
    prevision_amount: "456.7",
    office_code: "some updated office_code",
    debt_balance: "456.7",
    ClientsQuota: "some updated ClientsQuota",
    earned_amount: "456.7",
    INTE_adjust: "some updated INTE_adjust",
    clients_quota: "some updated clients_quota",
    plan_number: 43,
    condoned_amount: "456.7",
    previous_sec_payment: 43,
    previous_payment_date: ~U[2022-10-14 14:06:00Z],
    bill_number: "some updated bill_number",
    previous_paid_amount: "456.7",
    Cabbot.Creditos: "some updated Cabbot.Creditos",
    quota_delayed_days: 43,
    loan_code: "some updated loan_code",
    paid_amount: "456.7",
    previous_state_sub_code: "some updated previous_state_sub_code",
    quota_sec: 43,
    last_payment_penalty: "some updated last_payment_penalty",
    start_date: ~U[2022-10-14 14:06:00Z],
    payment_date: ~U[2022-10-14 14:06:00Z],
    quota_state: "some updated quota_state",
    previous_concept_state: "some updated previous_concept_state",
    payment_sec: 43,
    due_date: ~U[2022-10-14 14:06:00Z],
    quota_amount: "456.7",
    delayed_quota_history_days: 43,
    previous_earned_amount: "456.7",
    conpcept_code: "some updated conpcept_code",
    balance_sub_code: "some updated balance_sub_code"
  }
  @invalid_attrs %{balance_sub_code: nil, conpcept_code: nil, previous_earned_amount: nil, delayed_quota_history_days: nil, quota_amount: nil, due_date: nil, payment_sec: nil, previous_concept_state: nil, quota_state: nil, payment_date: nil, start_date: nil, last_payment_penalty: nil, quota_sec: nil, previous_state_sub_code: nil, paid_amount: nil, loan_code: nil, quota_delayed_days: nil, "Cabbot.Creditos": nil, previous_paid_amount: nil, bill_number: nil, previous_payment_date: nil, previous_sec_payment: nil, condoned_amount: nil, plan_number: nil, clients_quota: nil, INTE_adjust: nil, earned_amount: nil, ClientsQuota: nil, debt_balance: nil, office_code: nil, prevision_amount: nil, calc_number_days: nil, previous_quota_state: nil, concept_state: nil, user_code: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all credits", %{conn: conn} do
      conn = get(conn, Routes.credits_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create credits" do
    test "renders credits when data is valid", %{conn: conn} do
      conn = post(conn, Routes.credits_path(conn, :create), credits: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.credits_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "payment_date" => "2022-10-13T14:06:00Z",
               "user_code" => "some user_code",
               "delayed_quota_history_days" => 42,
               "condoned_amount" => "120.5",
               "INTE_adjust" => "some INTE_adjust",
               "balance_sub_code" => "some balance_sub_code",
               "previous_earned_amount" => "120.5",
               "debt_balance" => "120.5",
               "previous_sec_payment" => 42,
               "quota_delayed_days" => 42,
               "conpcept_code" => "some conpcept_code",
               "previous_concept_state" => "some previous_concept_state",
               "quota_state" => "some quota_state",
               "last_payment_penalty" => "some last_payment_penalty",
               "plan_number" => 42,
               "office_code" => "some office_code",
               "paid_amount" => "120.5",
               "payment_sec" => 42,
               "loan_code" => "some loan_code",
               "calc_number_days" => 42,
               "previous_paid_amount" => "120.5",
               "clients_quota" => "some clients_quota",
               "concept_state" => "some concept_state",
               "quota_sec" => 42,
               "ClientsQuota" => "some ClientsQuota",
               "previous_quota_state" => "some previous_quota_state",
               "Cabbot.Creditos" => "some Cabbot.Creditos",
               "start_date" => "2022-10-13T14:06:00Z",
               "bill_number" => "some bill_number",
               "due_date" => "2022-10-13T14:06:00Z",
               "prevision_amount" => "120.5",
               "previous_payment_date" => "2022-10-13T14:06:00Z",
               "previous_state_sub_code" => "some previous_state_sub_code",
               "earned_amount" => "120.5",
               "quota_amount" => "120.5"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.credits_path(conn, :create), credits: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update credits" do
    setup [:create_credits]

    test "renders credits when data is valid", %{conn: conn, credits: %Credits{id: id} = credits} do
      conn = put(conn, Routes.credits_path(conn, :update, credits), credits: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.credits_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "payment_date" => "2022-10-14T14:06:00Z",
               "user_code" => "some updated user_code",
               "delayed_quota_history_days" => 43,
               "condoned_amount" => "456.7",
               "INTE_adjust" => "some updated INTE_adjust",
               "balance_sub_code" => "some updated balance_sub_code",
               "previous_earned_amount" => "456.7",
               "debt_balance" => "456.7",
               "previous_sec_payment" => 43,
               "quota_delayed_days" => 43,
               "conpcept_code" => "some updated conpcept_code",
               "previous_concept_state" => "some updated previous_concept_state",
               "quota_state" => "some updated quota_state",
               "last_payment_penalty" => "some updated last_payment_penalty",
               "plan_number" => 43,
               "office_code" => "some updated office_code",
               "paid_amount" => "456.7",
               "payment_sec" => 43,
               "loan_code" => "some updated loan_code",
               "calc_number_days" => 43,
               "previous_paid_amount" => "456.7",
               "clients_quota" => "some updated clients_quota",
               "concept_state" => "some updated concept_state",
               "quota_sec" => 43,
               "ClientsQuota" => "some updated ClientsQuota",
               "previous_quota_state" => "some updated previous_quota_state",
               "Cabbot.Creditos" => "some updated Cabbot.Creditos",
               "start_date" => "2022-10-14T14:06:00Z",
               "bill_number" => "some updated bill_number",
               "due_date" => "2022-10-14T14:06:00Z",
               "prevision_amount" => "456.7",
               "previous_payment_date" => "2022-10-14T14:06:00Z",
               "previous_state_sub_code" => "some updated previous_state_sub_code",
               "earned_amount" => "456.7",
               "quota_amount" => "456.7"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, credits: credits} do
      conn = put(conn, Routes.credits_path(conn, :update, credits), credits: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete credits" do
    setup [:create_credits]

    test "deletes chosen credits", %{conn: conn, credits: credits} do
      conn = delete(conn, Routes.credits_path(conn, :delete, credits))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.credits_path(conn, :show, credits))
      end
    end
  end

  defp create_credits(_) do
    credits = credits_fixture()
    %{credits: credits}
  end
end
