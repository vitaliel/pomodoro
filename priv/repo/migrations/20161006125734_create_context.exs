defmodule Pomodoro.Repo.Migrations.CreateContext do
  use Ecto.Migration

  def change do
    create table(:contexts) do
      add :name, :string
      add :position, :integer

      timestamps()
    end

    alter table(:projects) do
      add :context_id, references(:contexts, type: :integer, null: false)
    end
  end
end
