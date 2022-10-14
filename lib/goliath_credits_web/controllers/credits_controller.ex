defmodule GoliathCreditsWeb.CreditsController do
  use GoliathCreditsWeb, :controller

  alias GoliathCredits.API
  
  alias GoliathCredits.API.Credits

  action_fallback GoliathCreditsWeb.FallbackController

@config Application.compile_env(:goliath_credits, :creditos)

  def create(conn, %{"Creditos" => credits_params}) do
    qm =
      credits_params
      |> Enum.map(&parse_params(&1))
      |> List.flatten()


    qmap =
      qm
      |> Enum.filter(fn z -> z |> Map.keys() == [:Quota] end)
      |> Enum.map(fn y -> y[:Quota] |> Map.new(fn {k, v} -> {k |> String.to_atom(), v} end) end)
    resp_q_data =
      GoliathCredits.Repo.insert_all(API.Quota, qmap, returning: true) |> elem(1)


    qcmap =
      qm
      |> Enum.filter(fn z -> z |> Map.keys() == [:ClientsQuota] end)
      |> Enum.map(fn y ->
        y[:ClientsQuota] |> Map.new(fn {k, v} -> {k |> String.to_atom(), v} end)
      end)
    resp_cq_data =
	GoliathCredits.Repo.insert_all(API.ClientsQuota, qcmap, returning: true)|> elem(1)


    parse_response(conn,resp_q_data ++ resp_cq_data,GoliathCreditsWeb.CreditsView)
  end

  def parse_response(cnx, data, view) do
    cnx
    |> put_view(view)
    |> render("render_many.json", credits: data)
  end


  def parse_params(data) do
    loan_code_field = data["Codprestamo"]
    quota_concept_list = data["CuotasConcepto"]
    quota_plan_list = data["PlanCuotas"]

    process_quota_map(quota_plan_list, loan_code_field) ++
      process_concept_quota_map(quota_concept_list, loan_code_field)
  end

  # ++++++++++++++++++++Para la tabla Cuota++++++++++++++++++++++++++++++++++

  def process_quota_map(quota_plan_list, loan_code_field) do
    quota_plan_list
    |> Enum.map(fn %{
                     "Diasatrcuota" => delayed_days_value,
                     "Estadocuota" => quota_state_value,
                     "Fechainicio" => start_date_value,
                     "Fechapago" => payment_date_value,
                     "Fechavencimiento" => due_date_value,
                     "Seccuota" => quota_sequence_value
                   } ->
      quota_final_map =
        %{
          "Diasatrcuota" => delayed_days_value,
          "Estadocuota" => quota_state_value,
          "Fechainicio" => start_date_value,
          "Fechapago" => payment_date_value,
          "Fechavencimiento" => due_date_value,
          "Seccuota" => quota_sequence_value
        }
        |> field_translator("PlanCuotas")
        |> request_data_merge(quota_map_fill_up(), loan_code_field)

      parsed_dates =
        quota_final_map
        |> extract_date_fields()

      proto_quota_map =
        Map.merge(quota_final_map, parsed_dates)
        |> Map.update!("payment_date", fn _x -> ~U[1970-01-01 00:00:00Z] end)
        |> Map.update!("quota_delayed_days", fn x -> x |> String.to_integer() end)
        |> Map.update!("quota_sec", fn x -> x |> String.to_integer() end)

      Enum.into([Quota: proto_quota_map], %{})
    end)
  end

  # ++++++++++++++++++++Para la tabla ClientsCuota++++++++++++++++++++++++++++++++++

  def process_concept_quota_map(quota_concept_list, loan_code_field) do
    quota_concept_list
    |> Enum.map(fn
      %{
        "Seccuota" => quota_sec_value,
        "Codconcepto" => concept_code_value,
        "Numdiascalc" => num_calc_days_values,
        "Montocuota" => quota_amount_value,
        "Montodevengado" => earned_amount_value,
        "Montopagado" => paid_amount_value,
        "Fechapago" => payment_date_value,
        "Estadoconcepto" => concept_state_value
      } ->
        concept_quota_final_map =
          %{
            "Seccuota" => quota_sec_value,
            "Codconcepto" => concept_code_value,
            "Numdiascalc" => num_calc_days_values,
            "Montocuota" => quota_amount_value,
            "Montodevengado" => earned_amount_value,
            "Montopagado" => paid_amount_value,
            "Fechapago" => payment_date_value,
            "Estadoconcepto" => concept_state_value
          }
          |> field_translator("CuotasConcepto")
          |> request_data_merge(concept_quota_map_fill_up(), loan_code_field)

        concept_parsed_dates =
          concept_quota_final_map
          |> extract_date_fields()

        proto_concept_quota_map =
          Map.merge(concept_quota_final_map, concept_parsed_dates)
          |> Map.update!("payment_date", fn _x -> ~U[1970-01-01 00:00:00Z] end)
          |> Map.update!("quota_sec", fn x -> x |> String.to_integer() end)
          |> Map.update!("calc_number_days", fn x -> x |> String.to_integer() end)
          |> Map.update!("earned_amount", fn x -> x |> String.to_float() end)
          |> Map.update!("paid_amount", fn x -> x |> String.to_float() end)
          |> Map.update!("quota_amount", fn x -> x |> String.to_float() end)

        Enum.into([ClientsQuota: proto_concept_quota_map], %{})
    end)
  end

  def request_data_merge(
        quota_plan_translated_fields,
        quota_fill_up,
        loan_code
      ) do
    Map.merge(quota_plan_translated_fields, quota_fill_up)
    |> Map.put(@config["Codprestamo"], loan_code)
  end

  def field_translator(quota_list, table_name) do
    Enum.into(quota_list, %{}, fn {k, v} ->
      {@config[table_name][k], v}
    end)
  end

  def convert_dates(dates_list) do
    dates_list
    |> Enum.map(fn {k, v} -> {k, Timex.parse(v, "%d/%m/%Y %H:%M:%S %Z", :strftime) |> elem(1)} end)
    |> Enum.into(%{})
  end

  def extract_date_fields(qmap) do
    qmap
    |> Map.keys()
    |> Enum.filter(&String.ends_with?(&1, "_date"))
    |> Enum.into(%{}, fn x -> {x, qmap[x]} end)
    |> Enum.filter(fn {_x, v} ->
      Regex.match?(~r/^[0-9][0-9]\/[0-9][0-9]\/[0-9][0-9][0-9][0-9]/, v |> to_string())
    end)
    |> Enum.map(fn {k, v} -> {k, v <> " 00:00:00 Z"} end)
    |> convert_dates()
  end

  def quota_map_fill_up() do
    @config["PlanCuotasFillupValues"]
  end

  def concept_quota_map_fill_up() do
    @config["CuotasConceptoFillupValues"]
  end

end
