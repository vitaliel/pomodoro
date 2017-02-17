defmodule Pomodoro.Repo.Migrations.AddCompletedAtToProjects do
  use Ecto.Migration

  def change do
    alter table(:projects) do
      add :completed_at, :datetime
    end
  end
end
