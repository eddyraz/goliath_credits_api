defmodule GoliathCreditsWeb.CreditsView do
  use GoliathCreditsWeb, :view
  alias GoliathCreditsWeb.CreditsView

  
  def render("render_many.json", data) do
    results =
      data[:credits]
      |> Enum.split_with(fn x -> x.__struct__ == GoliathCredits.API.Quota end)

    for n <- 0..1 do
      case n do
        0 ->
          Map.new([{:QuotasPlan, results |> elem(n)}])

        _ ->
          Map.new([{:QuotasConcept, results |> elem(n)}])
      end
    end
  end

end
