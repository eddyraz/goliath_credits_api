defmodule GoliathCredits.API do
  @moduledoc """
  The API context.
  """

  import Ecto.Query, warn: false
  alias GoliathCredits.Repo

  alias GoliathCredits.API.Quota

  @doc """
  Returns the list of quota.

  ## Examples

      iex> list_quota()
      [%Quota{}, ...]

  """
  def list_quota do
    Repo.all(Quota)
  end

  @doc """
  Gets a single quota.

  Raises `Ecto.NoResultsError` if the Quota does not exist.

  ## Examples

      iex> get_quota!(123)
      %Quota{}

      iex> get_quota!(456)
      ** (Ecto.NoResultsError)

  """
  def get_quota!(id), do: Repo.get!(Quota, id)

  @doc """
  Creates a quota.

  ## Examples

      iex> create_quota(%{field: value})
      {:ok, %Quota{}}

      iex> create_quota(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_quota(attrs \\ %{}) do
    %Quota{}
    |> Quota.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a quota.

  ## Examples

      iex> update_quota(quota, %{field: new_value})
      {:ok, %Quota{}}

      iex> update_quota(quota, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_quota(%Quota{} = quota, attrs) do
    quota
    |> Quota.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a quota.

  ## Examples

      iex> delete_quota(quota)
      {:ok, %Quota{}}

      iex> delete_quota(quota)
      {:error, %Ecto.Changeset{}}

  """
  def delete_quota(%Quota{} = quota) do
    Repo.delete(quota)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking quota changes.

  ## Examples

      iex> change_quota(quota)
      %Ecto.Changeset{data: %Quota{}}

  """
  def change_quota(%Quota{} = quota, attrs \\ %{}) do
    Quota.changeset(quota, attrs)
  end

  alias GoliathCredits.API.ClientsQuota

  @doc """
  Returns the list of clients_quota.

  ## Examples

      iex> list_clients_quota()
      [%ClientsQuota{}, ...]

  """
  def list_clients_quota do
    Repo.all(ClientsQuota)
  end

  @doc """
  Gets a single clients_quota.

  Raises `Ecto.NoResultsError` if the Clients quota does not exist.

  ## Examples

      iex> get_clients_quota!(123)
      %ClientsQuota{}

      iex> get_clients_quota!(456)
      ** (Ecto.NoResultsError)

  """
  def get_clients_quota!(id), do: Repo.get!(ClientsQuota, id)

  @doc """
  Creates a clients_quota.

  ## Examples

      iex> create_clients_quota(%{field: value})
      {:ok, %ClientsQuota{}}

      iex> create_clients_quota(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_clients_quota(attrs \\ %{}) do
    %ClientsQuota{}
    |> ClientsQuota.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a clients_quota.

  ## Examples

      iex> update_clients_quota(clients_quota, %{field: new_value})
      {:ok, %ClientsQuota{}}

      iex> update_clients_quota(clients_quota, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_clients_quota(%ClientsQuota{} = clients_quota, attrs) do
    clients_quota
    |> ClientsQuota.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a clients_quota.

  ## Examples

      iex> delete_clients_quota(clients_quota)
      {:ok, %ClientsQuota{}}

      iex> delete_clients_quota(clients_quota)
      {:error, %Ecto.Changeset{}}

  """
  def delete_clients_quota(%ClientsQuota{} = clients_quota) do
    Repo.delete(clients_quota)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking clients_quota changes.

  ## Examples

      iex> change_clients_quota(clients_quota)
      %Ecto.Changeset{data: %ClientsQuota{}}

  """
  def change_clients_quota(%ClientsQuota{} = clients_quota, attrs \\ %{}) do
    ClientsQuota.changeset(clients_quota, attrs)
  end
end
