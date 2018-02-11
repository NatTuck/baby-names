defmodule BabyNames.BabyTest do
  use BabyNames.DataCase

  alias BabyNames.Baby

  describe "names" do
    alias BabyNames.Baby.Name

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def name_fixture(attrs \\ %{}) do
      {:ok, name} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Baby.create_name()

      name
    end

    test "list_names/0 returns all names" do
      name = name_fixture()
      assert Baby.list_names() == [name]
    end

    test "get_name!/1 returns the name with given id" do
      name = name_fixture()
      assert Baby.get_name!(name.id) == name
    end

    test "create_name/1 with valid data creates a name" do
      assert {:ok, %Name{} = name} = Baby.create_name(@valid_attrs)
      assert name.name == "some name"
    end

    test "create_name/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Baby.create_name(@invalid_attrs)
    end

    test "update_name/2 with valid data updates the name" do
      name = name_fixture()
      assert {:ok, name} = Baby.update_name(name, @update_attrs)
      assert %Name{} = name
      assert name.name == "some updated name"
    end

    test "update_name/2 with invalid data returns error changeset" do
      name = name_fixture()
      assert {:error, %Ecto.Changeset{}} = Baby.update_name(name, @invalid_attrs)
      assert name == Baby.get_name!(name.id)
    end

    test "delete_name/1 deletes the name" do
      name = name_fixture()
      assert {:ok, %Name{}} = Baby.delete_name(name)
      assert_raise Ecto.NoResultsError, fn -> Baby.get_name!(name.id) end
    end

    test "change_name/1 returns a name changeset" do
      name = name_fixture()
      assert %Ecto.Changeset{} = Baby.change_name(name)
    end
  end

  describe "names" do
    alias BabyNames.Baby.Name

    @valid_attrs %{gender: "some gender", name: "some name"}
    @update_attrs %{gender: "some updated gender", name: "some updated name"}
    @invalid_attrs %{gender: nil, name: nil}

    def name_fixture(attrs \\ %{}) do
      {:ok, name} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Baby.create_name()

      name
    end

    test "list_names/0 returns all names" do
      name = name_fixture()
      assert Baby.list_names() == [name]
    end

    test "get_name!/1 returns the name with given id" do
      name = name_fixture()
      assert Baby.get_name!(name.id) == name
    end

    test "create_name/1 with valid data creates a name" do
      assert {:ok, %Name{} = name} = Baby.create_name(@valid_attrs)
      assert name.gender == "some gender"
      assert name.name == "some name"
    end

    test "create_name/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Baby.create_name(@invalid_attrs)
    end

    test "update_name/2 with valid data updates the name" do
      name = name_fixture()
      assert {:ok, name} = Baby.update_name(name, @update_attrs)
      assert %Name{} = name
      assert name.gender == "some updated gender"
      assert name.name == "some updated name"
    end

    test "update_name/2 with invalid data returns error changeset" do
      name = name_fixture()
      assert {:error, %Ecto.Changeset{}} = Baby.update_name(name, @invalid_attrs)
      assert name == Baby.get_name!(name.id)
    end

    test "delete_name/1 deletes the name" do
      name = name_fixture()
      assert {:ok, %Name{}} = Baby.delete_name(name)
      assert_raise Ecto.NoResultsError, fn -> Baby.get_name!(name.id) end
    end

    test "change_name/1 returns a name changeset" do
      name = name_fixture()
      assert %Ecto.Changeset{} = Baby.change_name(name)
    end
  end

  describe "comments" do
    alias BabyNames.Baby.Comment

    @valid_attrs %{comment: "some comment", stars: 42}
    @update_attrs %{comment: "some updated comment", stars: 43}
    @invalid_attrs %{comment: nil, stars: nil}

    def comment_fixture(attrs \\ %{}) do
      {:ok, comment} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Baby.create_comment()

      comment
    end

    test "list_comments/0 returns all comments" do
      comment = comment_fixture()
      assert Baby.list_comments() == [comment]
    end

    test "get_comment!/1 returns the comment with given id" do
      comment = comment_fixture()
      assert Baby.get_comment!(comment.id) == comment
    end

    test "create_comment/1 with valid data creates a comment" do
      assert {:ok, %Comment{} = comment} = Baby.create_comment(@valid_attrs)
      assert comment.comment == "some comment"
      assert comment.stars == 42
    end

    test "create_comment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Baby.create_comment(@invalid_attrs)
    end

    test "update_comment/2 with valid data updates the comment" do
      comment = comment_fixture()
      assert {:ok, comment} = Baby.update_comment(comment, @update_attrs)
      assert %Comment{} = comment
      assert comment.comment == "some updated comment"
      assert comment.stars == 43
    end

    test "update_comment/2 with invalid data returns error changeset" do
      comment = comment_fixture()
      assert {:error, %Ecto.Changeset{}} = Baby.update_comment(comment, @invalid_attrs)
      assert comment == Baby.get_comment!(comment.id)
    end

    test "delete_comment/1 deletes the comment" do
      comment = comment_fixture()
      assert {:ok, %Comment{}} = Baby.delete_comment(comment)
      assert_raise Ecto.NoResultsError, fn -> Baby.get_comment!(comment.id) end
    end

    test "change_comment/1 returns a comment changeset" do
      comment = comment_fixture()
      assert %Ecto.Changeset{} = Baby.change_comment(comment)
    end
  end
end
