defmodule BinaryTree do
  @type bst_node :: %{data: any, left: bst_node | nil, right: bst_node | nil}

  @doc """
  Create a new Binary Search Tree with root's value as the given 'data'
  """
  @spec new(any) :: bst_node
  def new(data) do
    %{data: data, left: nil, right: nil}
  end

  @doc """
  Creates and inserts a node with its value as 'data' into the tree.
  """
  @spec insert(bst_node, any) :: bst_node
  def insert(nil, data), do: new(data)
  
  def insert(%{data: node_value, left: smaller, right: greater}, data) when data <= node_value do
    %{data: node_value, left: insert(smaller, data), right: greater}
  end

  def insert(%{data: node_value, left: smaller, right: greater}, data) do
    %{data: node_value, left: smaller, right: insert(greater, data)}
  end

  @doc """
  Traverses the BST in order and returns a list of each node's data
  """
  @spec in_order(bst_node) :: [any]
  def in_order(nil), do: []

  def in_order(%{data: data, left: smaller, right: greater}) do
    in_order(smaller) ++ [data] ++ in_order(greater)
  end
end
