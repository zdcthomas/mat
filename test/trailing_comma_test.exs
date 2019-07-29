defmodule Code.Formatter.TrailingCommaTest do
  use ExUnit.Case, async: true

  import CodeFormatterHelpers

  @short_length [line_length: 10]
  @medium_length [line_length: 20]

  describe "lists" do
    test "ignores trailing_comma for single-line lists" do
      one_line = "[1, 2, 3]"

      assert_same(one_line)

      one_line_with_cons = "[1, 2, 3 | 4]"

      assert_same(one_line_with_cons)
    end

    test "respects trailing_comma: true` for multi-line lists" do
      multi_line = """
      [
        1,
        2,
        3,
      ]
      """

      assert_same(multi_line)

      multi_line_with_cons = """
      [
        1,
        2,
        3 | 4
      ]
      """

      assert_same(multi_line_with_cons)
    end
  end

  describe "maps" do
    test "ignores `trailing_comma: true` on single-line maps" do
      good_keyword = "%{a: 1, b: 2}"

      assert_same(good_keyword)

      good_assoc = "%{a => 1, b => 2}"

      assert_same(good_assoc)
    end

    test "respects `trailing_comma: true` on multi-line maps" do
      good_keyword = """
      %{
        first: 1,
        second: 2,
      }
      """

      assert_same(good_keyword)

      good_assoc = """
      %{
        key1 => value1,
        key2 => value2,
      }
      """

      assert_same(good_assoc)

      good_keyword_with_newlines = """
      %{
        first:
          expression1(),
        second:
          expression2(),
      }
      """

      assert_same(good_keyword_with_newlines, @medium_length)

      good_assoc_with_newlines = """
      %{
        key1 =>
          expression1(),
        key2 =>
          expression2(),
      }
      """

      assert_same(good_assoc_with_newlines, @medium_length)
    end
  end

  describe "maps with update" do
    test "ignores `trailing_comma: true` on single-line maps" do
      good_keyword = "%{foo | a: 1, b: 2}"

      assert_same(good_keyword)

      good_assoc = "%{foo | a => 1, b => 2}"

      assert_same(good_assoc)
    end

    test "respects `trailing_comma: true` on multi-line maps" do
      good_keyword = """
      %{
        foo
        | first: 1,
          second: 2,
          third: 3,
          fourth: 4,
      }
      """

      assert_same(good_keyword, @medium_length)

      good_assoc = """
      %{
        foo
        | key1 => value1,
          key2 => value2,
      }
      """

      assert_same(good_assoc, @medium_length)

      good_keyword_with_newlines = """
      %{
        foo
        | first:
            expression1(),
          second:
            expression2(),
      }
      """

      assert_same(good_keyword_with_newlines, @medium_length)

      good_assoc_with_newlines = """
      %{
        foo
        | key1 =>
            expression1(),
          key2 =>
            expression2(),
      }
      """

      assert_same(good_assoc_with_newlines, @medium_length)
    end
  end

  describe "structs" do
    test "ignores `trailing_comma: true` on single-line structs" do
      good_keyword = "%Foo{a: 1, b: 2}"

      assert_same(good_keyword)

      good_assoc = "%Foo{:a => 1, :b => 2}"

      assert_same(good_assoc)
    end

    test "respects `trailing_comma: true` on multi-line structs" do
      good_keyword = """
      %Foo{
        first: 1,
        second: 2,
        third: 3,
        fourth: 4,
      }
      """

      assert_same(good_keyword, @medium_length)

      good_assoc = """
      %Foo{
        :key1 => value1,
        :key2 => value2,
      }
      """

      assert_same(good_assoc, @medium_length)

      good_keyword_with_newlines = """
      %Foo{
        first:
          expression1(),
        second:
          expression2(),
      }
      """

      assert_same(good_keyword_with_newlines, @medium_length)

      good_assoc_with_newlines = """
      %Foo{
        :key1 =>
          expression1(),
        :key2 =>
          expression2(),
      }
      """

      assert_same(good_assoc_with_newlines, @medium_length)
    end
  end

  describe "struct with update" do
    test "ignores `trailing_comma: true` on single-line structs" do
      good_keyword = "%Foo{foo | a: 1, b: 2}"

      assert_same(good_keyword)

      good_assoc = "%Foo{foo | :a => 1, :b => 2}"

      assert_same(good_assoc)
    end

    test "respects `trailing_comma: true` on multi-line structs" do
      good_keyword = """
      %Foo{
        foo
        | first: 1,
          second: 2,
          third: 3,
          fourth: 4,
      }
      """

      assert_same(good_keyword, @medium_length)

      good_assoc = """
      %Foo{
        foo
        | :key1 => value1,
          :key2 => value2,
      }
      """

      assert_same(good_assoc, @medium_length)

      good_keyword_with_newlines = """
      %Foo{
        foo
        | first:
            expression1(),
          second:
            expression2(),
      }
      """

      assert_same(good_keyword_with_newlines, @medium_length)

      good_assoc_with_newlines = """
      %Foo{
        foo
        | :key1 =>
            expression1(),
          :key2 =>
            expression2(),
      }
      """

      assert_same(good_assoc_with_newlines, @medium_length)
    end
  end
end
