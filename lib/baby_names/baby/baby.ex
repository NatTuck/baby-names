defmodule BabyNames.Baby do
  @moduledoc """
  The Baby context.
  """

  import Ecto.Query, warn: false
  alias BabyNames.Repo

  alias BabyNames.Baby.Name

  @doc """
  Returns the list of names.

  ## Examples

      iex> list_names()
      [%Name{}, ...]

  """
  def list_names do
    Repo.all(Name)
  end

  @doc """
  Gets a single name.

  Raises `Ecto.NoResultsError` if the Name does not exist.

  ## Examples

      iex> get_name!(123)
      %Name{}

      iex> get_name!(456)
      ** (Ecto.NoResultsError)

  """
  def get_name!(id), do: Repo.get!(Name, id)

  @doc """
  Creates a name.

  ## Examples

      iex> create_name(%{field: value})
      {:ok, %Name{}}

      iex> create_name(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_name(attrs \\ %{}) do
    %Name{}
    |> Name.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a name.

  ## Examples

      iex> update_name(name, %{field: new_value})
      {:ok, %Name{}}

      iex> update_name(name, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_name(%Name{} = name, attrs) do
    name
    |> Name.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Name.

  ## Examples

      iex> delete_name(name)
      {:ok, %Name{}}

      iex> delete_name(name)
      {:error, %Ecto.Changeset{}}

  """
  def delete_name(%Name{} = name) do
    Repo.delete(name)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking name changes.

  ## Examples

      iex> change_name(name)
      %Ecto.Changeset{source: %Name{}}

  """
  def change_name(%Name{} = name) do
    Name.changeset(name, %{})
  end

  alias BabyNames.Baby.Comment

  @doc """
  Returns the list of comments.

  ## Examples

      iex> list_comments()
      [%Comment{}, ...]

  """
  def list_comments do
    Repo.all(Comment)
  end

  @doc """
  Gets a single comment.

  Raises `Ecto.NoResultsError` if the Comment does not exist.

  ## Examples

      iex> get_comment!(123)
      %Comment{}

      iex> get_comment!(456)
      ** (Ecto.NoResultsError)

  """
  def get_comment!(id), do: Repo.get!(Comment, id)

  @doc """
  Creates a comment.

  ## Examples

      iex> create_comment(%{field: value})
      {:ok, %Comment{}}

      iex> create_comment(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_comment(attrs \\ %{}) do
    %Comment{}
    |> Comment.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a comment.

  ## Examples

      iex> update_comment(comment, %{field: new_value})
      {:ok, %Comment{}}

      iex> update_comment(comment, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_comment(%Comment{} = comment, attrs) do
    comment
    |> Comment.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Comment.

  ## Examples

      iex> delete_comment(comment)
      {:ok, %Comment{}}

      iex> delete_comment(comment)
      {:error, %Ecto.Changeset{}}

  """
  def delete_comment(%Comment{} = comment) do
    Repo.delete(comment)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking comment changes.

  ## Examples

      iex> change_comment(comment)
      %Ecto.Changeset{source: %Comment{}}

  """
  def change_comment(%Comment{} = comment) do
    Comment.changeset(comment, %{})
  end
end
