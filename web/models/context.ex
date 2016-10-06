defmodule Pomodoro.Context do
  use Pomodoro.Web, :model

  schema "contexts" do
    field :name, :string
    field :position, :integer
    has_many :projects, Pomodoro.Project

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :position])
    |> validate_required([:name])
  end

  def default do
    from l in __MODULE__,
    order_by: [asc: l.name]
  end

  def positioned do
    from l in __MODULE__,
    order_by: [asc: l.position]
  end
end
