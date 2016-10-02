defmodule Pomodoro.Project do
  use Pomodoro.Web, :model

  schema "projects" do
    field :name, :string
    field :started_on, Ecto.Date
    field :description, :string
    field :pom_count, :integer
    field :pom_estimates, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :started_on, :description, :pom_estimates])
    |> validate_required([:name, :started_on, :pom_estimates])
  end
end
