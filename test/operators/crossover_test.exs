defmodule CrossoverTest do
  use ExUnit.Case

  alias Genex.Chromosome
  alias Genex.Operators.Crossover

  setup do
    [
      p1: %Chromosome{genes: [11, 12, 13, 14, 15, 16, 17, 18, 19, 20], size: 10},
      p2: %Chromosome{genes: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], size: 10}
    ]
  end

  describe "crossover methods" do
    test "single_point/2", context do
      c3 = Crossover.single_point(context.p1, context.p2)
      assert length(c3.genes) == 10
    end

    test "two_point/2", context do
      c3 = Crossover.two_point(context.p1, context.p2)
      assert length(c3.genes) == 10
    end

    test "uniform/2", context do
      c3 = Crossover.uniform(context.p1, context.p2, 0.5)
      assert length(c3.genes) == 10
    end

    test "blend/2", context do
      c3 = Crossover.blend(context.p1, context.p2, 0.5)
      assert length(c3.genes) == 10
    end

    test "simulated_binary/2", context do
      c3 = Crossover.simulated_binary(context.p1, context.p2, 0.5)
      assert length(c3.genes) == 10
    end

    test "messy_single_point/2", context do
      c3 = Crossover.messy_single_point(context.p1, context.p2)
      refute c3.genes == context.p1.genes
      refute c3.genes == context.p2.genes
    end
  end
end