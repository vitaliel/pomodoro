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
    field :is_completed, :boolean, virtual: true
    field :completed_at, Ecto.DateTime

    timestamps()
  end

  @doc """
  Builds a changeset based on the `cs` and `params`.
  """
  def changeset(cs, params \\ %{}) do
    params = if cs.completed_at do
      Map.put_new(params, "is_completed", true)
    else
      params
    end

    cs
    |> cast(params, [:name, :started_on, :description,
      :completed_at, :is_completed,
      :pom_estimates, :pom_count, :context_id])
    |> validate_required([:name, :started_on, :pom_estimates])
    |> set_defaults
    |> set_completed_at
  end

  defp set_completed_at(cs) do
    if get_field(cs, :is_completed) do
      if get_field(cs, :completed_at) do
        cs
      else
        change(cs, %{completed_at: Ecto.DateTime.utc})
      end
    else
      change(cs, %{completed_at: nil})
    end
  end

  defp set_defaults(cs) do
    unless get_field(cs, :started_on) do
      change(cs, %{started_on: Ecto.Date.utc})
    else
      cs
    end
  end

  def sorted_by_context(type \\ :active) do
    query = from p in __MODULE__,
      left_join: c in assoc(p, :context),
      order_by: [c.position, p.name]

    query = if type == :active do
      from q in query,
        where: is_nil(q.completed_at)
    else
      query
    end

    query
  end
end
