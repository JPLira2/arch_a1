defmodule Assignment1.AuthorsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Assignment1.Authors` context.
  """

  @doc """
  Generate a author.
  """
  def author_fixture(attrs \\ %{}) do
    {:ok, author} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name"
      })
      |> Assignment1.Authors.create_author()

    author
  end
end
