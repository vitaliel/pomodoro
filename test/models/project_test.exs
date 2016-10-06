defmodule Pomodoro.ProjectTest do
  use Pomodoro.ModelCase

  alias Pomodoro.Project

  @valid_attrs %{"description" => "some content", "name" => "some content",
    "pom_count" => 42, "pom_estimates" => 42, "started_on" => %{day: 17, month: 4, year: 2010}}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Project.changeset(%Project{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Project.changeset(%Project{}, @invalid_attrs)
    refute changeset.valid?
  end
end
