defmodule Pomodoro.Project do
  use Pomodoro.Web, :model

  alias Pomodoro.Context
  schema "projects" do
    field :name, :string
    field :started_on, Ecto.Date
    field :description, :string
    field :pom_count, :integer
    field :pom_estimates, :integer
    belongs_to :context, Context

    timestamps()
  end

  @doc """
  Builds a changeset based on the `cs` and `params`.
  """
  def changeset(cs, params \\ %{}) do
    params = Map.put_new(params, "started_on", Ecto.Date.utc)
    cs
    |> cast(params, [:name, :started_on, :description, :pom_estimates, :pom_count, :context_id])
    |> validate_required([:name, :started_on, :pom_estimates])
  end

  def sorted_by_context do
    from p in __MODULE__,
      left_join: c in assoc(p, :context),
      order_by: [c.position, p.name]
  end
end
