# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Assignment1.Repo.insert!(%Assignment1.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Assignment1.Models.Author

authors = [
  %Author{name: "Author 1", date_of_birth: ~D[1970-01-01], country_of_origin: "Country 1", description: "Description 1"},
  %Author{name: "Author 2", date_of_birth: ~D[1980-02-02], country_of_origin: "Country 2", description: "Description 2"}
]

Enum.each(authors, fn author ->
  Assignment1.Repo.insert!(author)
end)
