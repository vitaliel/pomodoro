defmodule Pomodoro.Repo.Migrations.CreateTask do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :title, :string
      add :description, :string
      add :project_id, references(:projects, type: :integer, null: false)

      timestamps()
    end

    create index(:tasks, [:project_id])
  end
end
