defmodule Pomodoro.Repo.Migrations.CreateProject do
  use Ecto.Migration

  def change do
    create table(:projects) do
      add :name, :string
      add :description, :text
      add :started_on, :date
      add :pom_count, :integer
      add :pom_estimates, :integer

      timestamps()
    end
  end
end
